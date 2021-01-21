//
//  Alert.swift
//  FinalProject
//
//  Created by Field Employee on 1/21/21.
//

import Foundation
import UIKit

struct Alert {
    
     static func showAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
//    static func showAlertForSignUpVC(on vc: UIViewController) {
//        showAlert(on: vc, with: "Error", message: <#T##String#>)
//    }
}
