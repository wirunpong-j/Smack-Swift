//
//  LoginVC.swift
//  Smack
//
//  Created by Wirunpong Jaingamlertwong on 7/1/2561 BE.
//  Copyright © 2561 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}
