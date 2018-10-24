//
//  AvatarCell.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 10/24/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import UIKit


//An enumeration to be able to switch back and forth between the types. Nice use!!
enum AvatarType {
    case dark
    case light
}

class AvatarCell: UICollectionViewCell {
 
    @IBOutlet weak var avatarImage : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpView()
    }
    
    //Based on the enumeration type (dark or light) we can select the images
    func configureCell(index: Int, type: AvatarType){
        if type == AvatarType.dark{
            avatarImage.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
        } else {
            avatarImage.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.darkGray.cgColor
        }
    }
    
    
    
    //Basic cell configuration
    func setUpView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    
}
