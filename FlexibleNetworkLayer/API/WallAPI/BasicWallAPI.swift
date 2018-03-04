//
//  BasicWallAPI.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

class BasicWallAPI: WallAPI {
    private lazy var getWallService: BaseService<Wall, VKAPIError> = {
        return VKAPIBuilder().buildAPI(Wall.self, nestedModelGetter: ResponseModelGetter.response)
    }()
    
    private lazy var postService: BaseService<[String: [String: Int]], VKAPIError> = {
        return VKAPIBuilder().buildAPI([String: [String: Int]].self)
    }()
    
    private lazy var getWallItemsCountService: BaseService<Int, VKAPIError> = {
        return VKAPIBuilder().buildAPI(Int.self, decodingProcessor: IntDecodingProcessor(),
                                   nestedModelGetter: ResponseModelGetter.wallResponseCount)
    }()
    
    func getWall(fromOwnerWith id: String, completion: @escaping (Wall) -> ()) {
        getWallService.request = WallRouter.GET(id, count: 20)

        getWallService.sendRequest()?.onSucces({ (wall) in
            completion(wall)
        })
    }
    
    func getWallItemsCount(fromOwnerWith id: String, completion: @escaping (Int) -> ()) {
        getWallItemsCountService.request = WallRouter.GET(id, count: 1)
        getWallItemsCountService.sendRequest()?.onSucces({ (count) in
            completion(count)
        })
    }
    
    func postWall(with message: String) {
        postService.request = WallRouter.POST(message: message)
        postService.sendRequest()
    }
}

