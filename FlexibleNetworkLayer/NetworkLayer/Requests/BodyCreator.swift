//
//  BodyCreator.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 04.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct BodyCreator {
    struct FileData {
        var fileName: String
        var mimeType: String
        var data: Data
    }
    
    var boundary: String
    private var boundaryPrefix: String {
        return "--\(boundary)\r\n"
    }
    private var finalBoundary: String {
        return "--\(boundary)--"
    }
    
    private var crlf = "\r\n\r\n"
    
    init(_ boundary: String) {
        self.boundary = boundary
    }
    
    func createBody(parameters: [String: String]) -> Data {
        var body = Data()

        for (key, value) in parameters {
            body.append(boundaryPrefix)
            body.append("Content-Disposition: form-data; name=\"\(key)\"\(crlf)")
            body.append("\(value)\(crlf)")
        }
        
        body.append(finalBoundary)
        
        return body as Data
    }
    
    func appendFile(_ file: FileData, to body: inout Data) -> Data {
        body.append(boundaryPrefix)
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(file.fileName)\"\(crlf)")
        body.append("Content-Type: \(file.mimeType)\(crlf)\(crlf)")
        body.append(file.data)
        body.append(crlf)
        
        return body
    }
}
