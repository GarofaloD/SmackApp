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
   
    // Spinner to ilustrate progress once we click on the create account button
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    //background color for the avatar
    var bgColor : UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Calling initial VC visual configuration and widgets
        setupView()
    }
    
    
    
    //Refreshing this VC to show the avatar picked by the user
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            //Check if the avatar is clear to provide a darker background
            if avatarName.contains("light") && bgColor == nil{
                userImg.backgroundColor = UIColor.lightGray
            }
        }
    }
    
    
    //When closing this window, it will take us to the main channels vc, hence the UNWIND identifier
    @IBAction func closeWhenPressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
    //Create account: register user, login and create
    @IBAction func createAccountPressed(_ sender: UIButton) {
        //Right after clicking on the button, we want the spinner to show up
        spinner.isHidden = false
        spinner.stopAnimating()
        
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
                                //If everything is successful, stop and hide the spinner
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
                    } else {
                        print ("error")
                    }
                })
            }
        }
    }
    
    
    
    //Go to Avatar picker VC
    @IBAction func pickedAvatarPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    //Randomly select a color for the avatar background
    @IBAction func pickBGColorPressed(_ sender: UIButton) {
        //Creation of random shades for each of the composing colors
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        //Compopsing the avatar background color and animating the display
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.2) {
            self.userImg.backgroundColor = self.bgColor
        }
    }
    
    //Initial VC visual configuration and widgets
    func setupView(){
        //spinner initial configuration
        spinner.isHidden = true
        
        //Placeholders initial text and color
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor : smackPurplePlaceholder])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor : smackPurplePlaceholder])
        passTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
    
        //Calling tap to dismiss the keyboard
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountViewController.handleTap))
        view.addGestureRecognizer(tap)
        
    }
    
    //func to dismiss keyboard
    @objc func handleTap(){
        view.endEditing(true)
    }
    

}
