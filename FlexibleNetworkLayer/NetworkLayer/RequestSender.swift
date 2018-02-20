//
//  RequestSender.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol RequestSender {
    func sendRequest(_ request: RequestRepresentable)
}
