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
    
    
}
