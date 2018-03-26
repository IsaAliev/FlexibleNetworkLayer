//
//  ViewController.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var marvelGetAPI: BaseService<MarvelCharactersList, BaseError>!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        marvelGetAPI = MarvelAPIBuilder().buildAPI(MarvelCharactersList.self,
                                                   request: MarvelCharacterRouter.GET(),
                                                   decodingProcessor: nil,
                                                   nestedModelGetter: ResponseModelGetter.data)
        
        marvelGetAPI.sendRequest()?.onSucces({ (list) in
            print(list)
        })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            print("The example of paging request: One more request")
            self.marvelGetAPI.sendRequest()?.onSucces({ (list) in
                print(list)
            })
        }
        
    }
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func postAction() {
        
    }
}

