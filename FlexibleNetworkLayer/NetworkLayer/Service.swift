//
//  Service.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol Service {
    associatedtype ResultTypeValue: Decodable
    
    var request: RequestRepresentable? { get set }
    var responseHandler: HTTPResponseHandler<ResultTypeValue>? { get set }
  
    func sendRequest()
}
