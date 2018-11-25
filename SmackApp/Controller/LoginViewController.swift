//
//  LoginViewController.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 10/4/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //Outlets
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }
    
    
    
    
    @IBAction func closePressed(_ sender: UIButton) {
        //To dismiss the VC. POn the completion property, set up nil  so id does not do anything else
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func createAccountWhenPressed(_ sender: UIButton) {
        performSegue(withIdentifier: GO_TO_CREATE_ACCOUNT, sender: nil)
    }
    
    
    
    
    
    
    @IBAction func logInWhenPressed(_ sender: RoundedButton) {
        
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = userNameText.text, userNameText.text != "" else {return}
        guard let passWord = passwordText.text, passwordText.text != "" else {return}
        
        AuthService.instance.loginUser(email: email, password: passWord) { (success) in
            if success{
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    
    func setUpView(){
        
        spinner.isHidden = true
        
        //Placeholders initial text and color
        userNameText.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor : smackPurplePlaceholder])
        passwordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        
        
    }
    
    
    
    
}
