//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by William Figueroa on 3/31/21.
//

import UIKit

class ResultsViewController: UIViewController
{
    override func viewDidLoad()
        {
            super.viewDidLoad()
            
            calculatePersonalityResult()
        
            navigationItem.hidesBackButton = true
        }
    
    var responses: [Answer]!

    func calculatePersonalityResult()
        {
            var frequencyOfAnswers: [Hero: Int] = [:]
            
            let ResponseType = responses.map { $0.type }
        
            for responses in ResponseType
                {
                    frequencyOfAnswers [responses] = (frequencyOfAnswers [responses] ?? 0) + 1
                
                }
        
            let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are \(mostCommonAnswer.rawValue)!"
        
            resultDefinitionLabel.text = mostCommonAnswer.definition
        }
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultDefinitionLabel: UILabel!
}
