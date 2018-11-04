//
//  ChannelViewController.swift
//  
//
//  Created by Daniel Garofalo on 10/3/18.
//

import UIKit

class ChannelViewController: UIViewController {

    //Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userImg: CircleImage!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //This will modify the amount of the view controller that will not be displayed. In this case, the whole frame - 60 pixels
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        //Calling the notification center and listening to the modification when happening
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelViewController.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: GO_TO_LOGIN, sender: nil)
    }
    
    //Modifying the avatar icon and login name on the channel vc with what we have on the UserDataService
    @objc func userDataDidChange(_ notif: Notification){
        if AuthService.instance.isLoggedIn {
            loginButton.setTitle(UserDataService.instance.userName, for: .normal)
            userImg.image = UIImage(named: UserDataService.instance.avatarName)
            userImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginButton.setTitle("login", for: .normal)
            userImg.image = UIImage(named: "menuProfileIcon")
            userImg.backgroundColor = UIColor.clear
        }
    }
    

}
