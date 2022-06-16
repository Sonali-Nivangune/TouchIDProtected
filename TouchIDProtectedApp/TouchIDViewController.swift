//
//  ViewController.swift
//  TouchIDProtectedApp
//
//  Created by Apple on 15/06/22.
//

import UIKit
import LocalAuthentication

class TouchIDViewController: UIViewController {
    
    @IBOutlet weak var authenticationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func authenticateUser(_ sender: UIButton) {
        let context = LAContext()
        var authorizationerror : NSError?
        let reason = "Need your biometric to login"
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authorizationerror){
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: {(success, error) in
                if success {
                    print("Authentication Successfull!")
                    DispatchQueue.main.async {
                        self.login()
                    }
                } else {
                    print("Authentication Failed")
                }
            })
        } else {
            print("not able to authenticate access ")
        }
    }
    
    func login(){
        let login = self.storyboard?.instantiateViewController(withIdentifier: "HomeScreenController") as! HomeScreenController
        self.navigationController?.pushViewController(login, animated: true)
    }
}

