//
//  HTTPClient.swift
//  Muzei
//
//  Created by Armin on 1/16/24.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type,
        shouldSeparate: Bool
    ) async throws -> T
}

extension HTTPClient {
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type,
        shouldSeparate: Bool = false
    ) async throws -> T {
        
        let urlComponents = URLComponents(string: endpoint.baseURL + endpoint.path)
        
        guard let url = urlComponents?.url else {
            throw RequestError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
        guard let response = response as? HTTPURLResponse else {
            throw RequestError.noResponse
        }
        switch response.statusCode {
        case 200...299:
            do {
                if shouldSeparate {
                    if let newlineIndex = data.firstIndex(of: UInt8(ascii: "\n")) {
                        let jsonPart = data.prefix(upTo: newlineIndex)
                        let decodedResponse = try JSONDecoder().decode(responseModel, from: jsonPart)
                        return decodedResponse
                    } else {
                        throw RequestError.decode
                    }
                } else {
                    let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
                    return decodedResponse
                }
            } catch {
                #if DEBUG
                print("💥 Execute error:")
                print(error)
                #endif
                throw RequestError.decode
            }
        case 400, 401:
            throw RequestError.unauthorized(data)
        default:
            throw RequestError.unexpectedStatusCode(response.statusCode)
        }
    }
}
