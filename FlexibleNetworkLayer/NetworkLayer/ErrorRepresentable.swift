//
//  ErrorRepresentable.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol ErrorRepresentable {
    var message: String? { get set }
    var statusCode: Int { get set }
    var data: Data? { get set }
}
