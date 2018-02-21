//
//  BaseService.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

class BaseService<T: Decodable>: Service {
    typealias ResultTypeValue = T

    var responseHandler: HTTPResponseHandler<T>? = HTTPResponseHandler<T>()
    var request: RequestRepresentable?

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
                case let .Value(model):
                    self?.processSuccess(model)
                case let .Error(error):
                    self?.processError(error)
                default:
                    break
                }
            })
        }.resume()
    }
    
    func processSuccess(_ model: T) {
        print(model)
    }
    
    func processSuccessString(_ string: String) {

    }
    
    func processError(_ error: ErrorRepresentable) {
        print(error)
    }
}

