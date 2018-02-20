//
//  BaseErrorCodeGetter.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct BaseErrorCodeGetter: ErrorCodeGetter {
    func errorCodeFrom(_ response: ResponseRepresentable) -> Int {
        return (response.response as? HTTPURLResponse)?.statusCode ?? 0
    }
}
