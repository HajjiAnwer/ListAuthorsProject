//
//  ViewController.swift
//  ListAuthorsProject
//
//  Created by Hajji Anwer on 2/4/20.
//  Copyright © 2020 Hajji Anwer. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class ViewController: UIViewController {

    @IBOutlet weak var signUPButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ModelUtilites.styleButton(button: signUPButton)
        ModelUtilites.styleButton(button: loginButton)
    }
}

