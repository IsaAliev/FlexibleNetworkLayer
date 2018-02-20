//
//  Service.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol Service {
    var request: RequestRepresentable? { get set }
    var responseHandler: ResponseHandler? { get set }
  
    func sendRequest()
}
