//
//  BaseService.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

class BaseService: NSObject, Service {
    var request: RequestRepresentable? {
        return BaseRequest()
    }
    
    var responseHandler: ResponseHandler? = BaseResponseHandler()
    var errorHandler: ErrorHandler?
    
    var session: URLSession {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        return session
    }
    
    func sendRequest() {
        guard let requestToSend = request else {
            return
        }
        
        guard var urlComponents = URLComponents(string: requestToSend.path) else {
            return
        }
        
        if let parametersJSON = requestToSend.parameters {
            var queryItems = [URLQueryItem]()
            for (key, value) in parametersJSON {
                queryItems.append(URLQueryItem(name: key, value: value as? String))
            }
            urlComponents.queryItems = queryItems
        }
        guard let url = urlComponents.url else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestToSend.HTTPMethod

        
        session.dataTask(with: urlRequest).resume()
    }
}

extension BaseService: URLSessionDataDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        let response = BaseResponse(data: data, error: nil)
        responseHandler?.handleResponse(response, completion: { (result) in
            print(result)
        })
    }
}
