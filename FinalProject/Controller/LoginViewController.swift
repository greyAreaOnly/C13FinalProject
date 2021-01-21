//
//  LoginViewController.swift
//  FinalProject
//
//  Created by Field Employee on 1/21/21.
//

import Foundation
import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //titleLabel.text = "⚡️FlashChat"
//        titleLabel.text = ""
//        var charIndex = 0.0
//        let titleText = K.appName
//        for leter in titleText {
////            print(charIndex)
////            print(leter)
//            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) { (timer) in
//                self.titleLabel.text?.append(leter)
//            }
//            charIndex += 1
//        }
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let error = error {
                    let message = error.localizedDescription
                    Alert.showAlert(on: self!, with: "Error", message: message)
                } else {
                    self!.performSegue(withIdentifier: "loginLeagueCell", sender: self)
                }
            }
        }
    }
    
    
}


