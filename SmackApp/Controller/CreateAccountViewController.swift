//
//  CreateAccountViewController.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 10/5/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    //Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //When closing this window, it will take us to the main channels vc, hence the UNWIND identifier
    @IBAction func closeWhenPressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
    //Actions
    @IBAction func createAccountPressed(_ sender: UIButton) {
        //Check for this text coming on this field, where the field cannot be empty. Else, return.
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let password = passTxt.text , passTxt.text != "" else { return }
        
        //Pass both fields on the registration. To get extra values on the completion handler(which will be the third value that needs to be passed) just press enter twice. The bool value we changed it for success.
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            //If successful on this first pass...
            if success {
                print("User registered. Going through login now...")
                //..Call on the service one more time to log in then user passing the same values..
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    //And if successful, print the following
                    if success {
                        print("User successfully logged in", AuthService.instance.authToken)
                    } else {
                        print ("error")
                    }
                })
            }
        }
    }
    
    
    
    
    @IBAction func pickedAvatarPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func pickBGColorPressed(_ sender: UIButton) {
    }
    
    
    
    

}
