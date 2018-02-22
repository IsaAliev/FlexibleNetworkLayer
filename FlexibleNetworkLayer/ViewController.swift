//
//  ViewController.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let service = BaseService<[String: Wall]>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        service.request = GETWallRequest()
        
        _ = service.sendRequest()?.onSucces({ (response) in
            print(response)
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

