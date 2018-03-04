//
//  ViewController.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imgurPOSTAPI: BaseService<IMGurImageInfo, BaseError>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgurPOSTAPI = IMGurAPIBuilder().buildAPI(IMGurImageInfo.self,
                                                  request: IMGurImageRouter.POST(#imageLiteral(resourceName: "BergenHordalandNorwayVagen.jpg"), name: "Big man in forest"),
                                                  nestedModelGetter: ResponseModelGetter.imgurImageInfo)
        
        imgurPOSTAPI.sendRequest()?
            .dispatchOn(DispatchQueue.main)
            .onSucces({ (response) in
                print(response)
            }).onFailure({ (error) in
                print(error)
            }).onProgress({ (progress) in
                print("Progress: \(progress)")
            })
    }
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func postAction() {
        
    }
}

