//
//  ViewController.swift
//  FlexibleNetworkLayer
//
//  Created by Isa Aliev on 19.02.18.
//  Copyright © 2018 IA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let service = BaseService<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let responseHandler = HTTPResponseHandler<String>()
        responseHandler.decodingProcessor = StringDecodingProcessor()
        responseHandler.nestedModelGetter = ResponseModelGetter.wallResponseFirstText
        responseHandler.successResponseChecker = VKAPISuccessChecker()
        responseHandler.errorHandler.errorMessageGetter = VKAPIErrorMessageGetter()
        responseHandler.errorHandler.errorCodeGetter = VKAPIErrorCodeGetter()
        service.responseHandler = responseHandler
        
        service.request = GETWallRequest()
        
        _ = service.sendRequest()?.onSucces({ (response) in
            print(response)
        }).onFailure({ (error) in
            print(error)
        }).onNone {
            print("LOSER")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

