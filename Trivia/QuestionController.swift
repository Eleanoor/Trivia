//
//  QuestionController.swift
//  Trivia
//
//  Created by Eleanoor Polder on 14-05-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//

import UIKit

class QuestionController {
    
    static let shared = QuestionController()
    let baseURL = URL(string: "http://jservice.io/api")!
    
    
    //     obtain questions
    func fetchQuestions(completion: @escaping ([Question]?) -> Void) {
        
        let questionURL = baseURL.appendingPathComponent("random")
        
        let task = URLSession.shared.dataTask(with: questionURL)
        { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data {
                do {
                    let questionItems = try jsonDecoder.decode([Question].self, from: data)
                    completion(questionItems)
                } catch {
                    print(error)
                }
            } else {
                completion(nil)
            }
        }
        task.resume()
    }

}
