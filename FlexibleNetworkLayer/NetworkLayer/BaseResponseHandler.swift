//
//  BaseResponseHandler.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

class BaseResponseHandler: ResponseHandler {
    func handleResponse(_ response: ResponseRepresentable, completion: (Result) -> ()) {
        if let error = response.error {
            completion(.Error(error))
            
            return
        }
        
        guard let dataResponse = response.data else {
            completion(.None)
            
            return
        }
        
        if let serializedObject = (try? JSONSerialization.jsonObject(with: dataResponse, options: [.mutableContainers, .allowFragments])),
            let json = serializedObject as? JSON {
            completion(.Value(json))
            
            return
        }
        //String(bytes: dataResponse, encoding: .utf8)
        completion(.None)
    }
}
