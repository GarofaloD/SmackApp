//
//  AvatarCell.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 10/24/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
 
    @IBOutlet weak var avatarImage : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpView()
        
        
    }
    
    func setUpView(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    
}
