//
//  IMGurImageRouter.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 03.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation
import UIKit

struct IMGurImageRouter {
    static let route = APIStrings.BaseURL.imgur + "image/"
    
    struct GET: HTTPGETRequest {
        var path: String = IMGurImageRouter.route
        var parameters: JSON? = [:]
        var headerFields: [String: String]? = [:]
        
        init(_ imageHash: String) {
            path += imageHash
        }
    }
    
    struct POST: HTTPPOSTRequest {
        var path: String = IMGurImageRouter.route
        var parameters: JSON? = [:]
        var headerFields: [String: String]? = [:]
        var body: Data?
        
        init(_ image: UIImage, name: String) {
            let boundary = "--XXX"
            headerFields?["Content-Type"] = "multipart/form-data; boundary=\(boundary)"
            if let imageData = UIImagePNGRepresentation(image) {
                let bodyCreator = BodyCreator(boundary)
                body = bodyCreator.createBody(parameters: ["image": imageData.base64EncodedString(),
                                                           "name": name])
            }
        }
        
    }
}
