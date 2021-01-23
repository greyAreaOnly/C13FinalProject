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
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func animateLabel() {
        label.text = ""
        var charIndex = 0.0
        let labelText = "get latest updates..."
        for leter in labelText {
            Timer.scheduledTimer(withTimeInterval: 0.2 * charIndex, repeats: false) { (timer) in
                self.label.text?.append(leter)
            }
            charIndex += 1
        }
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


