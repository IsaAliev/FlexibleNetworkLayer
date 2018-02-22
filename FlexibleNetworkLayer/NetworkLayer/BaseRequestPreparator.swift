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
        request.parameters?["access_token"] = "978dca0fdeff538760892951032737bd3df7695ccbec52f32dfc99918de068027c5684b08912bf41fed61"
    }
}
