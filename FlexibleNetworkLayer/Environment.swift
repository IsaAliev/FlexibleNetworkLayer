//
//  Environment.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 26.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct Environment {
    var env: [String: Any]? {
        var envDictionary: [String: Any]?
        if let path = Bundle.main.path(forResource: "env", ofType: "plist") {
            envDictionary = NSDictionary(contentsOfFile: path) as? [String: Any]
        }
        
        return envDictionary
    }
    
    subscript(path: String) -> String {
        get {
            let pathComponents = path.components(separatedBy: ".")
            var value = env
            
            for i in 0..<pathComponents.count {
                let component = pathComponents[i]
                
                if i == pathComponents.count - 1 {
                    return value?[component] as! String
                } else {
                    value = value?[component] as? [String : Any]
                }
            }
        
            return ""
        }
    }
}
