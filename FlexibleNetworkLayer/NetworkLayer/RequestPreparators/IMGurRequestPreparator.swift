//
//  IMGurRequestPreparator.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 03.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct IMGurRequestPreparator: RequestPreparator {
    func prepareRequest(_ request: inout HTTPRequestRepresentable) {
        request.headerFields?["Authorization"] = "Client-ID \(APIStrings.APIKey.imgurClientID)"
    }
}
