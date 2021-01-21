//
//  SignupViewController.swift
//  FinalProject
//
//  Created by Field Employee on 1/20/21.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func signupPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    let message = error.localizedDescription
                    Alert.showAlert(on: self, with: "Error", message: message)
                } else {
                    //Navigate to leguea VC
                    self.performSegue(withIdentifier: "leagueCell", sender: self)
                }
            }
        }
    }
    
    private func generateAlert(from error: Error) -> UIAlertController {
        print("called alert")
            let alert = UIAlertController(title: "Error", message: "We ran into an Error Description: \(error.localizedDescription)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAction)
            return alert
        }
    
}


/*
 let firebaseAuth = Auth.auth()
do {
try firebaseAuth.signOut()
 navigationController?.popToRootViewController(animated: true)
} catch let signOutError as NSError {
print ("Error signing out: %@", signOutError)
}

 */
