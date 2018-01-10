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
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        guard let name = usernameText.text, usernameText.text != nil else { return }
        guard let email = emailText.text, emailText.text != nil else { return }
        guard let password = passwordText.text, passwordText != nil else { return }
        
        AuthService.instance.registerUser(email: email, password: password){
            (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: {
                    (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: {
                            (success) in
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    @IBAction func chooseAvatarBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func genBGColorBtnPressed(_ sender: Any) {
    }
    
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
