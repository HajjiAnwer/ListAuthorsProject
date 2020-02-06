//
//  ModelUtilites.swift
//  ListAuthorsProject
//
//  Created by Hajji Anwer on 2/4/20.
//  Copyright © 2020 Hajji Anwer. All rights reserved.
//

import Foundation

import UIKit

class ModelUtilites {
    
    static func styleTextField (textField : UITextField){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: textField.frame.width - 2, height: 2)
        bottomLine.backgroundColor = UIColor.init(red: 88/255, green: 86/255, blue: 214/255, alpha: 1).cgColor
        textField.borderStyle = .roundedRect
        textField.layer.addSublayer(bottomLine)
    }
    static func styleButton (button : UIButton){
        button.layer.cornerRadius = 25
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor.init(red: 88/255, green: 86/255, blue: 214/255, alpha: 1)
    }
    static func isPasswordValid (password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    static func setButton(button : UIButton){
        button.layer.cornerRadius = 20
        button.layer.shadowColor = UIColor.blue.cgColor
        button.layer.shadowRadius = 3
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .zero
    }
    
}
