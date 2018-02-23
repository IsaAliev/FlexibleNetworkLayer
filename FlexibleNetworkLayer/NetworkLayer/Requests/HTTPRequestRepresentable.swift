//
//  HTTPRequestRepresentable.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

protocol HTTPRequestRepresentable {
    var path: String { get set }
    var httpMethod: HTTPMethod { get }
    var parameters: JSON? { get set }
    var headerFields: [String: String]? { get set }
    var bodyString: String? { get set }
}

extension HTTPRequestRepresentable {
    func urlRequest() -> URLRequest? {
        guard var urlComponents = URLComponents(string: self.path) else {
            return nil
        }
        
        if let parametersJSON = self.parameters {
            var queryItems = [URLQueryItem]()
            for (key, value) in parametersJSON {
                queryItems.append(URLQueryItem(name: key, value: value as? String))
            }
            urlComponents.queryItems = queryItems
        }
        
        guard let url = urlComponents.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headerFields
        if let body = bodyString {
            urlRequest.httpBody = body.data(using: .utf8)
        }
        
        return urlRequest
    }
}
