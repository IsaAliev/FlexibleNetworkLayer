//
//  Serializer.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

enum SerializationError: Error {
    case jsonCastingFailure
    case stringSerializationFailure
}

protocol Serializer {
    associatedtype SerializationResult
    
    func serialize(_ data: Data) throws -> SerializationResult
}

