//
//  BaseRequestPreparator.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 21.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct BaseRequestPreparator: RequestPreparator {
    func prepareRequest(_ request: inout HTTPRequestRepresentable) {
        request.parameters?["access_token"] = "<AccessToken Here>"
        request.parameters?["v"] = "5.73"
    }
}
