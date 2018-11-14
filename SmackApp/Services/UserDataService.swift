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
    
    //Singleton for this service
    static let instance = UserDataService()
    
    //properties
    private(set) public var id = ""
    private(set) public var avatarColor = ""
    private(set) public var avatarName = ""
    private(set) public var userEmail = ""
    private(set) public var userName = ""
    
    //Data pass
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String ) {
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.userEmail = email
        self.userName = name
    }
    
    //Additional pass for the avatar
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    
    //Decomp[osition of colors
    func returnUIColor(components: String) -> UIColor {
        //[0.07058823529411765,0.6313725490196078,0.8823529411764706,1]
        //Scanner for pieces of text
        let scanner = Scanner(string: components)
        //Values to be taken into account by the scanner to bypass or include
        let skipped = CharacterSet(charactersIn : "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        //Decomposition into primary colors and alpha
        var r, g, b, a : NSString?
        
        //scanning of the string and storing them into decomposition values
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        //Unrwapping of decomposition values, in case they exist or not
        guard let rUnrapped = r else {return defaultColor}
        guard let gUnrapped = g else {return defaultColor}
        guard let bUnrapped = b else {return defaultColor}
        guard let aUnrapped = a else {return defaultColor}
        
        //Passing the actual values as float from double
        let rFloat = CGFloat(rUnrapped.doubleValue)
        let gFloat = CGFloat(gUnrapped.doubleValue)
        let bFloat = CGFloat(bUnrapped.doubleValue)
        let aFloat = CGFloat(aUnrapped.doubleValue)
        
        //Assigning them to new color
        let newUIColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
        
        return newUIColor
    }
    
    //Function that clears all these values everytime we log out of the app
    func logoutUser(){
        self.id = ""
        self.avatarColor = ""
        self.avatarName = ""
        self.userEmail = ""
        self.userName = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
    }
    
    
    
    
    
}
