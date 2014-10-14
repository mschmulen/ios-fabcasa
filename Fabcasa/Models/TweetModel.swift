//
//  TweetModel.swift
//  FabApp
//
//  Created by Matthew Schmulen on 10/13/14.
//  Copyright (c) 2014 mschmulen. All rights reserved.
//

import UIKit

class TweetModel: BaseModel {
    var text: String!
    
    init(tweetDictionary: NSDictionary) {
        super.init()
        self.modelDictionary = tweetDictionary
        self.text = tweetDictionary["text"] as? String
    }
    
}
