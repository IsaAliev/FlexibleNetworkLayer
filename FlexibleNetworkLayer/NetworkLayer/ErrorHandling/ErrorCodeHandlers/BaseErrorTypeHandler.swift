//
//  BaseErrorTypeHandler.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct BaseErrorTypeHandler: ErrorTypeHandler {
    func handleError(with type: ErrorType) {
        print("Handled type \(type)")
    }
}
