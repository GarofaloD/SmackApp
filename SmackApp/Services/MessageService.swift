//
//  MessageService.swift
//  SmackApp
// This one will be used to pull channels and messages

//  Created by Daniel Garofalo on 11/28/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MessageService {
    
    static let instance = MessageService()
    
    //Instance from the channel model
    var channels = [Channel]()
    
    func findAllChannels(completion: @escaping CompletionHandler){
        
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else {return}
                
// //               Since it is coming on the shape of an array form the api...
//                if let json = JSON(data: data).array {
//
//                    //We have to drill into the array to get the values for each key...
//                    for item in json {
//                        let name = item["name"].stringValue
//                        let description = item["description"].stringValue
//                        let id = item["_id"].stringValue
//
//                        //And everytime we go through it, we create an object with te channel blueprint and we add it to the channels model
//                        let channel = Channel(title: name, description: description, id: id)
//
//                        self.channels.append(channel)
//                    }
//                    print(self.channels)
//                    completion(true)
//                }
                
                //This is the new way of Swift JSON parsing
                do {
                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
                }
                catch let error{
                    print("There was an error with the new json parsing method")
                    debugPrint(error as Any)
                }
                print(AuthService.instance.authToken)
                print(self.channels)
                completion(true)
                
            } else {
                completion(false)
                print("there was a big error")
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    
    
}
