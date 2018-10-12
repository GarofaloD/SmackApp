//
//  AuthService.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 10/12/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import Foundation
import Alamofire

class AuthService {
    
    //Singeton accessible globally and being accessed one at the time
    static let instance = AuthService()
    
    //Storing data permanently. Used for simple things
    let defaults = UserDefaults.standard
    
    //This will hold the status of a user logged in or not
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    //This will hold the authotization token to retrieve messages, for example
    var authToken : String{
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    
    //This will hold the user email
    var userEmail : String{
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    
    
    //Creating web request. For this, we use Alamo fire
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler){
        
        let lowerCaseEmail = email.lowercased()
       
        let header = [
            "Content Type" : "application/json; charset=utf-8"
        ]
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseString { (response) in
            
            if response.result.error == nil{
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    
    
    
    
    
    
    
    
}
