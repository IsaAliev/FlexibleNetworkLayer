//
//  VKAPIRequestPreparator.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 03.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct VKAPIRequestPreparator:  RequestPreparator {
    func prepareRequest(_ request: inout HTTPRequestRepresentable) {
        request.parameters?["access_token"] = "acces_token"
        request.parameters?["v"] = "5.73"
    }
}
