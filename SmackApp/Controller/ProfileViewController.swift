//
//  ProfileViewController.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 11/14/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //This one is the profile over window
    
    //Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }


    //Logging out clears everything out an d send s a notification for that
    @IBAction func logoutWhenPressed(_ sender: UIButton) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
        
    }
    
    
    //Close button
    @IBAction func closeModalPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //Values being cleared
    func setupView(){
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        profileImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        userName.text = UserDataService.instance.userName
        userEmail.text = UserDataService.instance.userEmail
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }

    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
