//  Minor Programmeren, AppStudio
//
//  QuestionViewController.swift
//  Trivia
//
//  Created by Eleanoor Polder on 14-05-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//
//  View Controller for Questions.

import UIKit

class QuestionViewController: UIViewController {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var submitAnswer: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    // MARK: - Variables
    
    // Initialize variables.
    var questionIndex = 0
    var questionItems = [Question]()
    var score = 0
    let questionCount = 5
    
    // MARK: - Functions
    
    /// Function for loading.
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    /// Function for Memory.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /// Function for updating the screen.
    func updateUI() {
        QuestionController.shared.fetchQuestions() { (questionItems) in
            if let questionItems = questionItems {
                DispatchQueue.main.async {
                    self.questionLabel.text = questionItems[0].question
        
                }
                self.questionItems = questionItems
            
            }
        }
        
        
        let totalProgress = Float(questionIndex) / Float(questionCount)
        progressView.setProgress(totalProgress, animated: true)
        
    }
    
    
    /// Function to check is answer is right.
    @IBAction func submitAnswerButtonTapped(_ sender: UIButton) {
        let currentAnswer = questionItems[0].answer
        let chosenAnswer = textField.text
        if currentAnswer ==  chosenAnswer {
            score += questionItems[questionIndex].value
        }
        nextQuestion()
    }
    
    
    /// Function for next question or result screen.
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questionCount {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    
    /// Function that connects the question to the result view.
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if segue.identifier == "ResultsSegue" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.score = score
        }
    }
    
    
}
    
    


