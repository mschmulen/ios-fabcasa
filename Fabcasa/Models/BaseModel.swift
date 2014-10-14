//
//  ModelBase.swift
//  FabApp
//
//  Created by Matthew Schmulen on 10/13/14.
//  Copyright (c) 2014 mschmulen. All rights reserved.
//

import UIKit

class BaseModel {
    
    var id: Int
    var modelDictionary: NSDictionary!
    
    init(id: Int) {
        self.id = id
    }
    
    init(){
        self.id = 0
    }
    
    init(modelDictionary: NSDictionary) {
        self.id = 0
        self.modelDictionary = modelDictionary
        //self.text = modelDictionary["text"] as? String
    }

}
