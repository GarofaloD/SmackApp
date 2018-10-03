//
//  ChannelViewController.swift
//  
//
//  Created by Daniel Garofalo on 10/3/18.
//

import UIKit

class ChannelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //This will modify the amount of the view controller that will not be displayed. In this case, the whole frame - 60 pixels
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }
    
    
    

}
