//
//  BaseService.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

final class BaseService<T: Decodable, E: ErrorRepresentable>: Service {
    typealias ResultType = T
    typealias ErrorType = E
    
    var responseHandler: HTTPResponseHandler<T, E>? = HTTPResponseHandler<T, E>()
    var request: HTTPRequestRepresentable?

    private var successHandler: SuccessHandlerBlock?
    private var failureHandler: FailureHandlerBlock?
    private var endHandler: (() -> ())?
    private var handlingQueue: DispatchQueue?

    var requestPreparator: RequestPreparator? = BaseRequestPreparator()
    
    private var session: URLSession {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
        
        return session
    }
    
    @discardableResult
    func sendRequest() -> BaseService<T, E>? {
        guard var request = request else {
            return nil
        }
        
        requestPreparator?.prepareRequest(&request)
        
        guard let urlRequest = request.urlRequest() else {
            return nil
        }

        session.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            let response = BaseResponse(data: data, response: response, error: error)

            self?.responseHandler?.handleResponse(response, completion: { [weak self] (result) in
                switch result {
                case let .Value(model):
                    self?.processSuccess(model)
                case let .Error(error):
                    self?.processError(error)
                }
                self?.processEnd()

            })
        }.resume()

        return self
    }
    
    @discardableResult
    func onSucces(_ success: @escaping SuccessHandlerBlock) -> BaseService<T, E> {
        successHandler = success
 
        return self
    }
    
    @discardableResult
    func onFailure(_ failure: @escaping FailureHandlerBlock) -> BaseService<T, E> {
        failureHandler = failure

        return self
    }
    
    @discardableResult
    func onEnd(_ end: @escaping () -> ()) -> BaseService<T, E> {
        endHandler = end

        return self
    }
    
    @discardableResult
    func dispatchOn(_ queue: DispatchQueue) -> BaseService<T, E> {
        handlingQueue = queue

        return self
    }
    
    private func processSuccess(_ model: T) {
        dispatch { [weak self] in
            self?.successHandler?(model)
        }
    }

    private func processError(_ error: E) {
        dispatch { [weak self] in
            self?.failureHandler?(error)
        }
    }
    
    private func processEnd() {
        dispatch { [weak self] in
            self?.endHandler?()
        }
    }
    
    private func dispatch(_ block: @escaping () -> ()) {
        guard let queue = handlingQueue else {
            block()
            return
        }
        
        queue.async {
            block()
        }
    }
}

