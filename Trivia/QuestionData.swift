//
//  QuestionData.swift
//  Trivia
//
//  Created by Eleanoor Polder on 14-05-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//

import Foundation

// Strucy for question.
struct Question: Codable {
    var question: String
    var answer: String
    var value: Int
}
