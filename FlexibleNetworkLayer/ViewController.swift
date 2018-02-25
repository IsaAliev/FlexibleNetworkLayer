//
//  ViewController.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let getWallService: WallGettable = BasicWallAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getWallService.getWall { (wall) in
            print(wall)
        }
    }
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func postAction() {
        
    }
}

