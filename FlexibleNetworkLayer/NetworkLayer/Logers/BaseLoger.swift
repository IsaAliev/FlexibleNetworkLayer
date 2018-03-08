//
//  BaseLoger.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 08.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct BaseLoger: Loger {
    func logResponse(_ response: ResponseRepresentable) {
        if let url = (response.response as? HTTPURLResponse)?.url {
            print("\nURL Responded: \(url)")
        }
        if let httpResponse = response.response as? HTTPURLResponse {
            print("    with code: \(httpResponse.statusCode)\n")
        }
    }
    
    func logRequest(_ request: HTTPRequestRepresentable) {
        print("\nSend \(request.httpMethod.rawValue) request...")
        if let url = request.urlRequest()?.url {
            print("   URL: \(url)\n")
        }
    }
}
