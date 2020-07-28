//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var choiceOneButton: UIButton!
    @IBOutlet var choiceTwoButton: UIButton!
    @IBOutlet var choiceThreeButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.systemGreen
        } else {
            sender.backgroundColor = UIColor.systemRed
        }
        
        quizBrain.nextQuestion()

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        let possibleAnswers = quizBrain.getPossibleAnswers()
        
        questionLabel.text = quizBrain.getQuestionText()
        choiceOneButton.setTitle(possibleAnswers[0], for: .normal)
        choiceTwoButton.setTitle(possibleAnswers[1], for: .normal)
        choiceThreeButton.setTitle(possibleAnswers[2], for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = quizBrain.getScore()
        choiceOneButton.backgroundColor = UIColor.clear
        choiceTwoButton.backgroundColor = UIColor.clear
        choiceThreeButton.backgroundColor = UIColor.clear
    }
    
}

