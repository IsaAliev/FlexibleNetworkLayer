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
        request.parameters?["access_token"] = "677595de1fdfcba20c371cccb0eb6f1cbc9457373788e7cf2674b1568510dea250b74c9f9e65eece1b321"
        request.parameters?["v"] = "5.73"
    }
}
