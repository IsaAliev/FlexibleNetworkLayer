//
//  VKAPIErrorMessageGetter.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct VKAPIErrorMessageGetter: ErrorMessageGetter {
    private let jsonSerializer = JSONSerializer()
    
    func messageFromErrorData(_ data: Data) -> String {
        guard let json = try? jsonSerializer.serialize(data) else {
            return ""
        }
        
        return (json["error"] as! JSON)["error_msg"] as? String ?? ""
    }
}
