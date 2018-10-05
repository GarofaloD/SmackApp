//
//  CreateAccountViewController.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 10/5/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeWhenPressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
