//
//  BaseService.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

class BaseService: Service {
    var responseHandler: ResponseHandler? = HTTPResponseHandler()
    
    var request: RequestRepresentable? = BaseRequest()
    
    var errorHandler: ErrorHandler?
    
    var session: URLSession {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
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

        session.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            let response = BaseResponse(data: data, response: response, error: error)
            
            self?.responseHandler?.handleResponse(response, completion: { [weak self] (result) in
                switch result {
                case let .JSONValue(json):
                    self?.processSuccesJSON(json)
                case let .Error(error):
                    self?.processError(error)
                case let .StringValue(string):
                    self?.processSuccessString(string)
                default:
                    break
                }
            })
        }.resume()
    }
    
    func processSuccesJSON(_ json: JSON) {
        
    }
    
    func processSuccessString(_ string: String) {
        
    }
    
    func processError(_ error: ErrorRepresentable) {
        
    }
}

