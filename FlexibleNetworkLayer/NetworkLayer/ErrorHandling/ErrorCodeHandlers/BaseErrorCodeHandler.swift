//
//  BaseErrorCodeHandler.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct BaseErrorCodeHandler: ErrorCodeHandler {
    func handleError(with code: Int) {
        print("Handled code \(code)")
    }
}
