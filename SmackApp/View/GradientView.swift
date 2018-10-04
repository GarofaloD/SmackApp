//
//  GradientView.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 10/4/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import UIKit
@IBDesignable

class GradientView: UIView {

    //Made to track independently this color without changing it on every instruction. This will also change how it does look dynamically
    @IBInspectable var topColor : UIColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
        didSet{
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor : UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1) {
        didSet{
            self.setNeedsLayout()
        }
    }
    
    //Creating the view for the gradient
    override func layoutSubviews() {
        //variable that will hold the settings of the custom gradient
        let gradientLayer = CAGradientLayer()
        //Colors for the gradient
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        //Staring point on the view for the gradients
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        //size of the view
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }

}
