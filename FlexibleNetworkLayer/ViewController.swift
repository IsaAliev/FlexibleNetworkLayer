//
//  ViewController.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let ghReposService: ReposGettable = ReposAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ghReposService.getRepos { (repos) in
            print(repos)
        }
    }

}

