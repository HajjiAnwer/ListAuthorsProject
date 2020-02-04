//
//  SignInViewController.swift
//  ListAuthorsProject
//
//  Created by Hajji Anwer on 2/4/20.
//  Copyright © 2020 Hajji Anwer. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElemnts()
    }
    

    @IBAction func loginButtonPRessed(_ sender: Any) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil{
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else{
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constant.Stroryboard.homeViewController) as? HomeViewController
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
        
    }
    
    func setUpElemnts()  {
        errorLabel.alpha = 0
        ModelUtilites.styleButton(button: signUpButton)
        ModelUtilites.styleButton(button: loginButton)
        ModelUtilites.styleTextField(textField: emailTextField)
        ModelUtilites.styleTextField(textField: passwordTextField)
    }
}
