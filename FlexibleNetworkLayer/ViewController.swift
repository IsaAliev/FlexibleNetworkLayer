//
//  ViewController.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let service: WallPostable = BasicWallAPI()
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func postAction() {
        service.postWall(with: textField.text!)
    }
}

