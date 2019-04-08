//
//  AnswerModel.swift
//  Quiz
//
//  Created by Katheryne Graf on 07/04/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import Foundation

class Answer {
    var answer:String!
    var isCorrect: Bool!
    
    init(answer:String, isCorrect:Bool) {
        self.answer = answer
        self.isCorrect = isCorrect
    }
}
