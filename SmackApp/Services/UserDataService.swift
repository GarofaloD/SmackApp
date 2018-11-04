//
//  UserDataService.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 10/15/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.

//UserDataService will hold:
// - Varibales that will hold the responses from the api when logging in
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    private(set) public var id = ""
    private(set) public var avatarColor = ""
    private(set) public var avatarName = ""
    private(set) public var userEmail = ""
    private(set) public var userName = ""
    
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String ) {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.userEmail = email
        self.userName = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
    func returnUIColor(components: String) -> UIColor {
        //[0.07058823529411765,0.6313725490196078,0.8823529411764706,1]
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn : "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a : NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        guard let rUnrapped = r else {return defaultColor}
        guard let gUnrapped = g else {return defaultColor}
        guard let bUnrapped = b else {return defaultColor}
        guard let aUnrapped = a else {return defaultColor}
        
        let rFloat = CGFloat(rUnrapped.doubleValue)
        let gFloat = CGFloat(gUnrapped.doubleValue)
        let bFloat = CGFloat(bUnrapped.doubleValue)
        let aFloat = CGFloat(aUnrapped.doubleValue)
        
        let newUIColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        
        return newUIColor
    }
    
    
    
    
    
    
    
}
