//
//  ErrorMessageGetter.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 20.02.2018.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol ErrorMessageGetter {
    func messageFromErrorData(_ data: Data) -> String
}
