//
//  ReposAPI.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 23.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import Foundation

class ReposAPI: ReposGettable {
    lazy var getReposService: BaseService<[GitHubRepo]> = {
        let apiBuilder = GitHubAPIBuilder<[GitHubRepo]>()
        
        return apiBuilder.buildAPI(for: GETReposRequest())
    }()
    
    func getRepos(completion: @escaping ([GitHubRepo]) -> ()) {
        getReposService.sendRequest()?.onSucces({ (repos) in
            completion(repos)
        })
    }
}
