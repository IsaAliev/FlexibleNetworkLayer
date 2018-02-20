//
//  SuccessResponseChecker.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol SuccessResponseChecker {
    func isSuccesResponse(_ response: ResponseRepresentable) -> Bool
}
