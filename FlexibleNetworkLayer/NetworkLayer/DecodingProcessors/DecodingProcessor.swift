//
//  DecodingProcessor.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol DecodingProcessor {
    associatedtype DecodingResult
    
    func decodeFrom(_ data: Data) throws -> DecodingResult
}
