//
//  JSONSerializer.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation


struct JSONSerializer: Serializer {
    typealias SerializationResultType = JSON
    
    func serialize(_ data: Data) throws -> JSON {
        let serializedObject = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
        guard let json = serializedObject as? JSON else {
            throw SerializationError.jsonCastingFailure
        }
        
        return json
    }
}

