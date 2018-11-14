//
//  AuthService.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 10/12/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

//AuthService will hold:
// - Defaults for storing username, login status and authorization token
// - Register user function pointing to the registar site
// = Login user function pointing to the login site

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    //Singeton accessible globally and being accessed one at the time during the lifetime of the app
    static let instance = AuthService()
    
    //Storing data permanently. Used for simple things. This is useful because it will help the user to not type the password everytime the app is open, for example
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
            return defaults.value(forKey: TOKEN_KEY) as! String //This one has to be unwrapped since it comes as an optional by default
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
    
    //Creating web request to register the user. For this, we use Alamofire. Remember to import that library.
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler){
        //Passing the email as lowercase string
        let lowerCaseEmail = email.lowercased()
        
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
        //Header is the one that we just created. Remember that this is associated with the content type. UPDATE: Now the header is on the constants file
        //Then, we need to add what we want to add a completion handler. A closure with responseString and we double Enter to access more parameters for the response. if there are no errors, the completion that we are managing sis true. Otherwise, it is false and we print an error
        
        
        
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            
            //If there are no errors...
            if response.result.error == nil{
                //The completion handler (bool in this case) wil show as true
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    //Creating web request to log the user in.
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler){
        //Passing the email as lowercase string
        let lowerCaseEmail = email.lowercased()
        
        //Body as JSON
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
    
        //In thi scase, we need to have a completion handler with the capability to manage the JSON respose, considering that the API will return a token on a JSON format. This is called json parsing
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            //If there are no errors...
            if response.result.error == nil {
                
                  //JSON PARSING THE BASIC WAY
//                //And if we are hetting a response as a JSON...
//                if let responseJSON = response.result.value as? Dictionary<String, Any> {
//                    //Grab the user, if exists and associate it with the username value
//                    if let emailFromJSON = responseJSON["user"] as? String {
//                        self.userEmail = emailFromJSON
//                    }
//                    //Same with the token
//                    if let tokenFromJSON = responseJSON["token"] as? String {
//                        self.authToken = tokenFromJSON
//                    }
//                }
                
                // JSON PARSING USING SWIFTYJSON. Check documentation
                //1.We need to get the response data
                guard let data = response.data else {return}
                let json = JSON(data: data)
                self.userEmail = json["user"].stringValue
                self.authToken = json["token"].stringValue
                
                self.isLoggedIn = true
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler){
        
        let lowercasedEmail = email.lowercased()
        
        let body = [
            "name": name,
            "email": lowercasedEmail,
            "avatarName": avatarName,
            "avatarColor" : avatarColor
        ]
     
        //This header brings another value that needs to be managed using the auth token. We need to get the token from the instance. WE CANNOT PULL IT JUST LIKE A PLAIN VALUE
        let header = [
            "Authorization" : "Bearer \(AuthService.instance.authToken)",
             "Content-Type" : "application/json; charset=utf-8"
        ]
        
        //We make the http request as usual...
        Alamofire.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            //... and we check for the respponse using SWIFTYJSON in this case...
            if response.result.error == nil {
                guard let data = response.data else {return}
                let json  = JSON(data: data)
                
                //But for this one, we need to create a set of variables that will hold all the response variables coming from the api
                let id = json["_id"].stringValue
                let color = json["avatarColor"].stringValue
                let avatarName = json["avatarName"].stringValue
                let email = json["email"].stringValue
                let name = json["name"].stringValue
                
                //And we pass that set of variables to the AuthService
                UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)
                completion(true)
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    
    
}
