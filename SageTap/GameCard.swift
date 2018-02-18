//
//  GameCard.swift
//  SageTap
//
//  Created by Greenleaf Media on 2/17/18.
//  Copyright © 2018 Sage Tap LLC. All rights reserved.
//

import Foundation

class GameCard {
    
    var answer: Int = 0
    var question: String = ""
    var options: NSArray = []
    
    func initWithDict(aDict: [String: AnyObject]) {
        
        self.answer = (aDict["answer"] as! NSString).integerValue
        self.question = aDict["question"] as! String
        self.options = aDict["options"] as! NSArray
    }
}
