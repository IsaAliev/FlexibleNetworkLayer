//
//  ViewController.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let getWallAPI: WallGettable = BasicWallAPI()
    
    var getUsersAPI: BaseService<[User], VKAPIError>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getUsersAPI = VKAPIBuilder().buildAPI([User].self, nestedModelGetter: ResponseModelGetter.wallResponse)
        getUsersAPI.request = UsersRouter.GET(["idHere","idHere","idHere"], fields: [])
        
        getUsersAPI.sendRequest()?.dispatchOn(DispatchQueue.main)
            .onSucces({ (users) in
                print(users)
                print(Thread.isMainThread)
            }).onEnd {
                print(Thread.isMainThread)
        }
        
    }
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func postAction() {
        
    }
}

