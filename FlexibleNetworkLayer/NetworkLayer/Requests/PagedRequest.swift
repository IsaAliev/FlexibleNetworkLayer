//
//  PagedRequest.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 26.03.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

protocol PagedRequest: HTTPGETRequest {
    func prepareForNext(with response: ResponseRepresentable)
    func resetToStart()
}
