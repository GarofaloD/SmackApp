//
//  ChatViewController.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 10/3/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var menuButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //This allows for the button to move this very same VC iun order to reveal the VC that is in the back
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        //These two allow for this same vc to be dragged and tapped to the original position
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
        
        //VERY IMPORTANT: This check would allow us to verify if we are logged in. If we are, all the fields should be populated with the infor from UserDataService by sending the notification
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            }
        }
        
        MessageService.instance.findAllChannels { (success) in
            if success {
                //print (MessageService.instance.channels)
            }

        }
        
        
        
        
        
    }
    
    
    


}
