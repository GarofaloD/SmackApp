//
//  Channel.swift
//  SmackApp
//
//  Created by Daniel Garofalo on 11/28/18.
//  Copyright © 2018 Daniel Garofalo. All rights reserved.
//

import Foundation

//This is for the Swift JSON Parsing. Also, the properties need to have the exact same name
struct Channel : Decodable{
    
    private(set) public var _id : String!
    private(set) public var name : String!
    private(set) public var description : String!
    private(set) public var __v : Int?
    
//    //Init provided by me. It was not in the video
//    init(title: String, description: String, id: String){
//        self.name = title
//        self._id = id
//        self.description = description
//    }

    
}
