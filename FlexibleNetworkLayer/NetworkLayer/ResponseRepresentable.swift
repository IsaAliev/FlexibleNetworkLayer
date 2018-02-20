//
//  ResponseRepresentable.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol ResponseRepresentable {
    var data: Data? { get set }
    var error: ErrorRepresentable? { get set }
}
