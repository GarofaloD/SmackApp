//
//  RoundedButton.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 10/12/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import UIKit
@IBDesignable

class RoundedButton: UIButton {

    //Corner radius for the buttons
    @IBInspectable var cornerRadius : CGFloat = 3.0 {
        //Property observer.. This property will be changed with whatever value we change on the storyboard
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }

    override func awakeFromNib() {
        self.setUpView()
    }
    
    func setUpView(){
        self.layer.cornerRadius = cornerRadius
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        self.setUpView()
    }
    
    
}
