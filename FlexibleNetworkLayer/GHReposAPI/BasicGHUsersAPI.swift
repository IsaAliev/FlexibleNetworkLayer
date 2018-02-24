//
//  BasicGHUsersAPI.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

class BasicGHUsersAPI: GitHubUsersAPI {
    var service: BaseService<String>?
    
    func getLocationFor(_ user: String, completion: @escaping (String) -> ()) {
        let apiBuilder = GitHubAPIBuilder<String>()
        
        service = apiBuilder.buildAPI(for: GETUsersLocationRequest(user), decodingProcessor: StringDecodingProcessor(), nestedModelGetter: GitHubNestedModelGetter.usersLocation)
        _ = service?.sendRequest()?.onSucces({ (city) in
            completion(city)
        })
    }
}
