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

    var session: URLSession {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
        return session
    }
    
    func sendRequest() {
        guard let urlRequest = request?.urlRequest() else {
            return
        }

        session.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            let response = BaseResponse(data: data, response: response, error: error)
            
            self?.responseHandler?.handleResponse(response, completion: { [weak self] (result) in
                switch result {
                case let .JSONValue(json):
                    self?.processSuccessJSON(json)
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
    
    func processSuccessJSON(_ json: JSON) {
        print(json)
    }
    
    func processSuccessString(_ string: String) {

    }
    
    func processError(_ error: ErrorRepresentable) {
        
    }
}

