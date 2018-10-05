//
//  LoginViewController.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 10/4/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func closePressed(_ sender: UIButton) {
        //To dismiss the VC. POn the completion property, set up nil  so id does not do anything else
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func createAccountWhenPressed(_ sender: UIButton) {
        performSegue(withIdentifier: GO_TO_CREATE_ACCOUNT, sender: nil)
    }
    
}
