//
//  BaseService.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

final class BaseService<T: Decodable, E: ErrorRepresentable>: NSObject, Service, URLSessionTaskDelegate {
    typealias ResultType = T
    typealias ErrorType = E
    
    var responseHandler: HTTPResponseHandler<T, E>? = HTTPResponseHandler<T, E>()
    var request: HTTPRequestRepresentable?
    var loger: Loger = BaseLoger()
    
    private var successHandler: SuccessHandlerBlock?
    private var failureHandler: FailureHandlerBlock?
    private var progressHandler: ((Double) -> ())?
    private var endHandler: (() -> ())?
    private var lastPageHandler: (() -> ())?
    private var handlingQueue: DispatchQueue?
    private var currentResponse: ResponseRepresentable?
    private var processOnlyLastPage: Bool = false
    
    var requestPreparator: RequestPreparator? = BaseRequestPreparator()
    
    private var session: URLSession {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
        return session
    }
    
    @discardableResult
    func sendRequest() -> BaseService<T, E>? {
        guard var request = request else {
            return nil
        }
        
        if processLastPageIfNeeded() {
            return self
        }

        requestPreparator?.prepareRequest(&request)
        
        guard let urlRequest = request.urlRequest() else {
            return nil
        }
        
        loger.logRequest(request)
        
        session.dataTask(with: urlRequest) { [weak self] (data, response, error) in
            guard let strongSelf = self else { return }
            
            strongSelf.currentResponse = BaseResponse(data: data, response: response, error: error)
            strongSelf.loger.logResponse(strongSelf.currentResponse!)
            strongSelf.responseHandler?.handleResponse(strongSelf.currentResponse!, completion: { [weak self] (result) in
                guard let `self` = self else {
                    return
                }
                
                switch result {
                case let .Value(model):
                    self.preparePagedRequestIfNeeded(with: model)
                    guard self.isRequestPaged() && self.isPagesEnded() else {
                        self.processSuccess(model)
                        return
                    }
                    
                    if !self.processOnlyLastPage {
                        self.processSuccess(model)
                    }
                    
                    self.processLastPage()
                case let .Error(error):
                    self.processError(error)
                }
                self.processEnd()
            })
            
            }.resume()

        return self
    }
    
    @discardableResult
    func onlyLastPage() -> BaseService<T, E> {
        processOnlyLastPage = true
        
        return self
    }
    
    func resetRequest() {
        guard let pagedRequest = request as? PagedRequest<T> else {
                return
        }
        
        pagedRequest.resetToStart()
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
    func onProgress(_ progress: @escaping (Double) -> ()) -> BaseService<T, E> {
        progressHandler = progress
        
        return self
    }
    
    @discardableResult
    func dispatchOn(_ queue: DispatchQueue) -> BaseService<T, E> {
        handlingQueue = queue

        return self
    }
    
    @discardableResult
    func onLastPage(_ lastPage: @escaping () -> ()) -> BaseService<T, E> {
        lastPageHandler = lastPage
        
        return self
    }
    
    private func processLastPageIfNeeded() -> Bool {
        if isPagesEnded() {
            processLastPage()
            
            return true
        }
        
        return false
    }
    
    private func isPagesEnded() -> Bool {
        if let pagedRequest = request as? PagedRequest<T> {
            return pagedRequest.isPagesDidEnd
        }
        
        return true
    }
    
    private func isRequestPaged() -> Bool {
        return request is PagedRequest<T>
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
    
    private func processLastPage() {
        dispatch { [weak self] in
            self?.lastPageHandler?()
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
    
    private func preparePagedRequestIfNeeded(with model: T) {
        guard let pagedRequest = request as? PagedRequest<T> else {
            return
        }
        
        pagedRequest.prepareForNext(with: model)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        dispatch { [weak self] in
            if #available(iOS 11.0, *) {
                self?.progressHandler?(task.progress.fractionCompleted)
            } else {
                self?.progressHandler?(Double(task.countOfBytesReceived)/Double(task.countOfBytesExpectedToReceive))
            }
        }
    }
}

