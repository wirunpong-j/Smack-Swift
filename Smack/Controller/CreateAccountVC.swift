//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Wirunpong Jaingamlertwong on 7/1/2561 BE.
//  Copyright © 2561 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        guard let email = emailText.text, emailText.text != nil else { return }
        guard let password = passwordText.text, passwordText != nil else { return }
        
        AuthService.instance.registerUser(email: email, password: password){
            (success) in
            if success {
                print("Registered User!!!")
            }
        }
    }
    
    @IBAction func chooseAvatarBtnPressed(_ sender: Any) {
    }
    
    @IBAction func genBGColorBtnPressed(_ sender: Any) {
    }
    
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
