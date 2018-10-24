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
    
    //Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    
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
        guard let name = usernameTxt.text , usernameTxt.text != "" else { return }
        
        
        
        //Pass both fields on the registration. To get extra values on the completion handler(which will be the third value that needs to be passed) just press enter twice. The bool value we changed it for success.
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            //If successful on this first pass...
            if success {
                print("User registration in process. Going through login now...")
                //..Call on the service one more time to log in then user passing the same values..
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        print("User successfully logged in", AuthService.instance.authToken)
                        //...Call on the service a third time to create the user
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                print("User completely registered!")
                                print("Username = \(UserDataService.instance.userName). Avatar = \(UserDataService.instance.avatarName)")
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    } else {
                        print ("error")
                    }
                })
            }
        }
    }
    
    
    
    
    @IBAction func pickedAvatarPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    
    @IBAction func pickBGColorPressed(_ sender: UIButton) {
    }
    
    
    
    

}
