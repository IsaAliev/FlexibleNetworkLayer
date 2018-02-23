//
//  BasicWallAPI.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

struct BasicWallAPI: WallAPI {
    let getService = BaseService<Wall>()
    let postService = BaseService<[String: [String: Int]]>()
    
    func getWall(completion: @escaping (Wall) -> ()) {
        getService.request = GETWallRequest()
        
        let responseHandler = HTTPResponseHandler<Wall>()
        responseHandler.nestedModelGetter = ResponseModelGetter.wallResponse
        responseHandler.successResponseChecker = VKAPISuccessChecker()
        
        getService.responseHandler = responseHandler
        
        _ = getService.sendRequest()?.onSucces({ (wall) in
            completion(wall)
        })
    }
    
    func postWall(with message: String) {
        postService.request = POSTWallRequest(message: message)
        
        _ = postService.sendRequest()
    }
}
