//
//  APIStrings.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 03.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct APIStrings {
    static var env = Environment()
    
    struct BaseURL {
        static let imgur = "https://api.imgur.com/3/"
        static let vk = "https://api.vk.com/method/"
        static let marvel = "https://gateway.marvel.com/v1/public/"
    }
    
    struct APIKey {
        static let imgurClientID = env["APIKey.imgurClientID"]  as! String
        static let marvelPublicKey = env["APIKey.marvelPublicKey"]  as! String
        static let marvelPrivateKey = env["APIKey.marvelPrivateKey"] as! String
    }
}

