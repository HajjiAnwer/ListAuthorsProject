//
//  SignUpViewController.swift
//  ListAuthorsProject
//
//  Created by Hajji Anwer on 2/4/20.
//  Copyright © 2020 Hajji Anwer. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
class SignUpViewController: UIViewController {
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signUPButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElement()
    }
    func validateFields() -> String? {
        //cheek all the field that filled ion
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please Fill in all fieldss"
        }
        return nil
    }
    @IBAction func signUPButoonPressed(_ sender: Any) {
        let error = validateFields()
        if error != nil {
            showError(message: error!)
        }
        else{
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password) { (results, err) in
                if err != nil{
                    self.showError(message: "Error creating user")
                }
                else{
                    let db = Firestore.firestore()
                    db.collection("user").addDocument(data: ["firstname":firstName,"username":username,"uid":results!.user.uid]) { (error) in
                        if error != nil{
                            self.showError(message: "error saving user data😔")
                        }
                        self.showSuccess(message: "seccussefull Sign up, You can login now😊")
                        self.transitionToHomePage()
                    }
                }
            }
        }
    }
    func transitionToHomePage (){
        let homeViewController = storyboard?.instantiateViewController(identifier: Constant.Stroryboard.homeViewController) as? HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    func showError(message : String)  {
        errorLabel.text = message
        errorLabel.alpha = 1
        errorLabel.textColor = UIColor.red
    }
    func showSuccess(message: String) {
        showError(message: message)
        errorLabel.textColor = UIColor.green
        firstNameTextField.text = ""
        usernameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
    }
        
    func setUpElement()  {
        errorLabel.alpha = 0
        ModelUtilites.styleTextField(textField: firstNameTextField)
        ModelUtilites.styleTextField(textField: usernameTextField)
        ModelUtilites.styleTextField(textField: emailTextField)
        ModelUtilites.styleTextField(textField: passwordTextField)
        ModelUtilites.styleButton(button: signUPButton)
        ModelUtilites.styleButton(button: backButton)
    }
}
