//
//  BasicWallAPI.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

class BasicWallAPI: WallAPI {
    lazy var getWallService: BaseService<Wall, VKAPIError> = {
        let apiBuilder = VKAPIBuilder<Wall>()
        
        return apiBuilder.buildAPI(for: GETWallRequest(),
                                    nestedModelGetter: ResponseModelGetter.wallResponse)
    }()
    
    lazy var postService: BaseService<[String: [String: Int]], VKAPIError> = {
        let service = BaseService<[String: [String: Int]], VKAPIError>()
        
        return service
    }()
    
    lazy var getWallItemsCountService: BaseService<Int, VKAPIError> = {
        let apiBuilder = VKAPIBuilder<Int>()
        
        return apiBuilder.buildAPI(for: GETWallRequest(), decodingProcessor: IntDecodingProcessor(), nestedModelGetter: ResponseModelGetter.wallResponseCount)
    }()
    
    func getWall(completion: @escaping (Wall) -> ()) {
        _ = getWallService.sendRequest()?.onSucces({ (wall) in
            completion(wall)
        })
    }
    
    func getWallItemsCount(completion: @escaping (Int) -> ()) {
        _ = getWallItemsCountService.sendRequest()?.onSucces({ (count) in
            completion(count)
        })
    }
    
    func postWall(with message: String) {
        postService.request = POSTWallRequest(message: message)
        _ = postService.sendRequest()
    }
}

