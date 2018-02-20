//
//  StringSerializer.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

class StringSerializer: Serializer {
    typealias SerializationResultType = String
    
    func serialize(_ data: Data) throws -> String {
        guard let string = String(bytes: data, encoding: .utf8) else {
            throw SerializationError.stringSerializationFailure
        }
        
        return string
    }
}
