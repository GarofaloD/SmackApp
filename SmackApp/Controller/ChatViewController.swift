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

        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
    }
    
    
    


}
