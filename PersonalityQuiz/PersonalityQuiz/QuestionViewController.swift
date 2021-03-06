//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by William Figueroa on 3/31/21.
//

import UIKit

class QuestionViewController: UIViewController
{
    override func viewDidLoad()
        {
            super.viewDidLoad()
            
            updateUI()
        }
    
    var questions: [Question] = [
        Question (text: "What is your favorite color?",
                  type: .single,
                  answers: [
                    Answer (text: "Blue", type: .Superman),
                    Answer (text: "Black", type: .Batman),
                    Answer (text: "Yellow", type: .WonderWoman),
                    Answer (text: "Red", type: .Flash)]),
    
        Question (text: "What is your favorite school subject?",
                  type: .multiple,
                  answers: [
                    Answer (text: "science", type: .Superman),
                    Answer (text: "physics", type: .Batman),
                    Answer (text: "history", type: .WonderWoman),
                    Answer (text: "gym", type: .Flash)]),
                            
        Question (text: "Do you enjoy having super powers?",
                  type: .ranged,
                  answers: [
                    Answer (text: "I dislike them", type: .Batman),
                    Answer (text: "I dislike them a little", type: .Superman),
                    Answer (text: "I barley like them", type: .WonderWoman),
                    Answer (text: "I love them", type: .Flash)])]
    
    var questionIndex = 0
    var answerChosen: [Answer] = []
    
    @IBAction func singleButtonPressed(_ sender: UIButton)
        {
            let currentAnswers = questions[questionIndex].answers
            
            switch sender
                {
                    case singleButton1:
                        answerChosen.append(currentAnswers[0])
                        
                    case singleButton2:
                        answerChosen.append(currentAnswers[1])
                        
                    case singleButton3:
                        answerChosen.append(currentAnswers[2])
                        
                    case singleButton4:
                        answerChosen.append(currentAnswers[3])
                        
                    default:
                        break;
                }
            
            nextQuestion()
        }
    
    @IBAction func multipleAnswerButtonPressed()
        {
            let currentAnswers = questions[questionIndex].answers
            
            if multiSwitch1.isOn
                {
                answerChosen.append(currentAnswers[0])
                }
        
            if multiSwitch2.isOn
                {
                    answerChosen.append(currentAnswers[1])
                }
        
            if multiSwitch3.isOn
                {
                    answerChosen.append(currentAnswers[2])
                }
        
            if multiSwitch4.isOn
                {
                    answerChosen.append(currentAnswers[3])
                }
        
            nextQuestion()
        }
    
    @IBAction func rangedAnswerButtonPressed()
        {
            let currentAnswers = questions[questionIndex].answers
            let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
            answerChosen.append(currentAnswers[index])
        
            nextQuestion()
        }
    
    func nextQuestion()
        {
            questionIndex += 1
        
            if questionIndex < questions.count
                {
                    updateUI()
                }
        
            else
                {
                    performSegue(withIdentifier: "ResultsSegue", sender: nil)
                }
        }
    
    func updateUI()
        {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float (questionIndex) / Float (questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type
            {
                case .single:
                    updateSingleStack(using: currentAnswers)
                    
                case .multiple:
                    updateMultipleStack(using: currentAnswers)
                    
                case .ranged:
                    updateRangedStack(using: currentAnswers)
            }
        }
    
    func updateSingleStack(using answers: [Answer])
        {
            singleStackView.isHidden = false
            singleButton1.setTitle(answers[0].text, for: .normal)
            singleButton2.setTitle(answers[1].text, for: .normal)
            singleButton3.setTitle(answers[2].text, for: .normal)
            singleButton4.setTitle(answers[3].text, for: .normal)
        }
    
    func updateMultipleStack(using answers: [Answer])
        {
            multipleStackView.isHidden = false
            multiSwitch1.isOn = false
            multiSwitch2.isOn = false
            multiSwitch3.isOn = false
            multiSwitch4.isOn = false
        
            multiLabel1.text = answers[0].text
            multiLabel2.text = answers[1].text
            multiLabel3.text = answers[2].text
            multiLabel4.text = answers[3].text
        }
    
    func updateRangedStack(using answers: [Answer])
        {
            rangedStackView.isHidden = false
            rangedLabel1.text = answers.first?.text
            rangedLabel2.text = answers.last?.text
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if segue.identifier == "ResultsSegue"
            {
                let resultsViewController = segue.destination as! ResultsViewController
            
                resultsViewController.responses = answerChosen
            }
        }
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!
    
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
}
