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
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //This will modify the amount of the view controller that will not be displayed. In this case, the whole frame - 60 pixels
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: GO_TO_LOGIN, sender: nil)
    }
    
    

}
