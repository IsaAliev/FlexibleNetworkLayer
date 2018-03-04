//
//  ErrorRepresentable.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol ErrorRepresentable {
    var message: String? { get set }
    var errorCode: Int? { get set }
    var type: ErrorType { get set }
    
    init(_ type: ErrorType)
    init(_ response: ResponseRepresentable)
}

protocol ErrorType {
    var rawValue: Int { get }
}
