//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuesitons = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuesitons.list[questionNumber]
        questionLabel.text = firstQuestion.questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        }
        else if sender.tag == 2{
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    
    func updateUI() {
      
    }
    
    func nextQuestion() {
        print(questionNumber)
        if questionNumber <= 12{
            questionLabel.text = allQuesitons.list[questionNumber].questionText
        }
        else{
//            let alert = UIAlertController(title: "Awesome", message: "You've reached the end, would you like to start over?", preferredStyle: .alert)
            
            let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
//            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
//                NSLog("The \"OK\" alert occured.")
//            }))
            
            
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuesitons.list[questionNumber].answer
        if correctAnswer == pickedAnswer{
            print("you got it!")
        }
        else {
            print("wrong!")
        }
    }
    
    
    func startOver() {
        questionNumber = 0
        nextQuestion()
    }
    

    
}
