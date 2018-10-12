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
    
    
    
    //Creating web request to register the user. For this, we use Alamo fire
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler){
        //Passing the email as lowercase string
        let lowerCaseEmail = email.lowercased()
       
        //The header needs to be of this particular type
        let header = [
            "Content-Type" : "application/json; charset=utf-8"
        ]
        
        //Body as JSON
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        //URL_Register part of the constants. Also, the response is aliased from the completionHandler:
        //URL convertible will be the url for registering. Declared on the constants
        //Method is the one used for this oarticular request. It needs to be a post
        //Parameters makes reference to what is passed on the body of the request. On the api, is marked as the body
        //Encoding makes reference to the one json standard
        //Header is the one that we just created. Remember that this is associated with the content type
        //Then, we need to add what we want to add a completion handler. A closure with responseString and we double Enter to access more parameters for the response. if there are no errors, the completion that we are managing sis true. Otherwise, it is false and we print an error
        
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
