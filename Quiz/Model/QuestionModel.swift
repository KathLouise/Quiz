//
//  QuestionModel.swift
//  Quiz
//
//  Created by Katheryne Graf on 07/04/19.
//  Copyright © 2019 Katheryne Graf. All rights reserved.
//

import UIKit

class Question {
    var questionLabel:String!
    var questionImage:UIImage!
    var answers:[Answer]!
    
    init(questionLabel:String, questionImageName:String, answers:[Answer]) {
        self.questionLabel = questionLabel
        self.questionImage = UIImage(named: questionImageName)
        self.answers = answers
    }
}
