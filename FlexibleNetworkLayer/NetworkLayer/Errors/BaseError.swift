//
//  BaseError.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct BaseError: ErrorRepresentable {
    var errorCode: Int
    var message: String?
}
