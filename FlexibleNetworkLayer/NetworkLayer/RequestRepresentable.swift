//
//  RequestRepresentable.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol RequestRepresentable {
    var path: String { get set }
    var HTTPMethod: String { get set }
    var parameters: JSON? { get set }
}
