//  Minor Programmeren, App Studio
//
//  ResultViewController.swift
//  Trivia
//
//  Created by Eleanoor Polder on 14-05-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//
//  View Controller for the results.

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    var score: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsLabel.text = "You have \(score!) points!"
    }
}
