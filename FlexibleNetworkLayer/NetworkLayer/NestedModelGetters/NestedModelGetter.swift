//
//  NestedModelGetter.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 22.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

enum NestedModelGettingError: Error {
    case keysDoNotMatchJSON
    case failedToSerializeData
}

protocol NestedModelGetter {
    var keyPath: String { get }
    var escapedModelKey: String { get }
}

extension NestedModelGetter {
    var escapedModelKey: String {
        return "escaped"
    }
    
    func keysSequence() -> [String] {
        return keyPath.split(separator: ".").map({ String($0) })
    }
    
    func getFrom(_ data: Data) throws -> JSON {
        let jsonSerializer = JSONSerializer()
        
        guard let json = try? jsonSerializer.serialize(data) else {
            throw NestedModelGettingError.failedToSerializeData
        }
        
        let keys = keysSequence()
        
        var iteratingObject: Any? = json
        
        for key in keys {
            iteratingObject = retreive(iteratingObject, key: key)
        }

        if iteratingObject != nil {
            return [escapedModelKey: iteratingObject!]
        }

        throw NestedModelGettingError.failedToSerializeData
    }
    
    private func retreive(_ object: Any?, key: String) ->  Any? {
        if let json = object as? JSON {
            return json[key]
        }
        
        if let arrayOfJSONs = object as? [JSON] {
            for json in arrayOfJSONs {
                guard let result = json[key] else {
                    continue
                }
                
                return result
            }
        }
        
        return nil
    }
}




