//
//  DataProvider.swift
//  CryptoApp
//
//  Created by Rodrigo Adauto Ortiz on 8/05/24.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
}

class DataProvider {
    typealias CryptoResp<T: Decodable> = Result<T, Error>
    
    static func doRequest<T: Decodable>(with urlString: String,
                                        decodable: T.Type,
                                        params: [String: String]? = nil,
                                        httpRequest: HTTPMethod,
                                        body: Any? = nil,
                                        completion: @escaping (CryptoResp<T>) -> Void) {
        let url = URL(string: urlString)
        guard let url else {
            completion(.failure(CryptoError.url))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpRequest.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.timeoutInterval = 10
        if let params {
            for (key, value) in params {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        if let body, urlRequest.httpMethod == HTTPMethod.POST.rawValue {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body.self)
        }
        URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            if let error = error {
                if let httpURLResponse = urlResponse as? HTTPURLResponse {
                    completion(.failure(CryptoError.backend(httpURLResponse.statusCode)))
                }
            } else {
                guard let data else {
                    completion(.failure(CryptoError.dataError))
                    return
                }
                let response = try? JSONDecoder().decode(T.self, from: data)
                guard let response else {
                    completion(.failure(CryptoError.parsing))
                    return
                }
                completion(.success(response))
            }
        }.resume()
    }
    
    static func doRequestAsync<T: Decodable>(with urlString: String,
                                      decodable: T.Type,
                                      params: [String: String]? = nil,
                                      httpRequest: HTTPMethod,
                                      body: Any? = nil) async -> CryptoResp<T> {
        let url = URL(string: urlString)
        guard let url else {
            return .failure(CryptoError.url)    
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpRequest.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.timeoutInterval = 10
        if let params {
            for (key, value) in params {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        if let body, urlRequest.httpMethod == HTTPMethod.POST.rawValue {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body.self)
        }
        do {
            let response = try await URLSession.shared.data(for: urlRequest)
            if let httpUrlResponse = response.1 as? HTTPURLResponse {
                switch httpUrlResponse.statusCode {
                case 200...299:
                    if let result = try? JSONDecoder().decode(T.self, from: response.0) {
                        return .success(result)
                    }
                    return .failure(CryptoError.parsing)
                case 400...499:
                    return .failure(CryptoError.backend(httpUrlResponse.statusCode))
                default:
                    break
                }
            }
            return .failure(CryptoError.parsing)
        } catch {
            return .failure(CryptoError.dataError)
        }
    }
}
