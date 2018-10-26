//
//  CircleImage.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 10/25/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import UIKit
@IBDesignable

class CircleImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
    }
    
    func setupView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
}
