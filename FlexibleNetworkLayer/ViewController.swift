//
//  ViewController.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let ghReposAPI: ReposGettable = ReposAPI()
    let ghUserAPI: GitHubUsersAPI = BasicGHUsersAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ghReposAPI.getRepos { (repos) in
            print(repos)
        }
        
        ghUserAPI.getLocationFor("IsaAliev") { (city) in
            print(city)
        }
    }

}

