//
//  ErrorHandler.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol ErrorHandler {
    var errorCodeHandler: ErrorCodeHandler { get set }
    var errorCodeGetter: ErrorCodeGetter { get set }
    var errorMessageGetter: ErrorMessageGetter { get set }
    
    func handleErrorResponse(_ response: ResponseRepresentable, completion: (Result) -> ())
}
