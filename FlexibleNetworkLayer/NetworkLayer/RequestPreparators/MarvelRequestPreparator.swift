//
//  MarvelRequestPreparator.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 26.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct MarvelRequestPreparator: RequestPreparator {
    func prepareRequest(_ request: inout HTTPRequestRepresentable) {
        let timeStampString = String(Date().timeIntervalSince1970)
        let stringToMakeHashFrom = timeStampString + APIStrings.APIKey.marvelPrivateKey + APIStrings.APIKey.marvelPublicKey
        
        request.parameters?["ts"] = timeStampString
        request.parameters?["apikey"] = APIStrings.APIKey.marvelPublicKey
        request.parameters?["hash"] = stringToMakeHashFrom.MD5String()
    }
}
