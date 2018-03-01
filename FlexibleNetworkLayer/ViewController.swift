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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getWallAPI.getWallItemsCount(fromOwnerWith: "<some id>") { (count) in
            print("Wall items count is \(count)")
        }
    }
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func postAction() {
        
    }
}

