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

        marvelGetAPI = APIBuilder()
            .setRequest(MarvelCharacterRouter.GET())
            .setRequestPreparator(MarvelRequestPreparator())
            .setNestedModelGetter(ResponseModelGetter.data)
            .build(for: MarvelCharactersList.self)
        
        marvelGetAPI.sendRequest()?.onSucces({ (list) in
            print(list)
        }).onLastPage {
            print("We reached last page")
        }
    }
    
    @IBOutlet weak var textField: UITextField!

    @IBAction func postAction() {
        
    }
}

