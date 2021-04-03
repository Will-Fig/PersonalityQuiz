//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by William Figueroa on 3/31/21.
//

import Foundation

struct Question
    {
        var text: String
        var type: ResponseType
        var answers: [Answer]
    }

enum ResponseType
    {
        case single, multiple, ranged
    }

struct Answer
    {
        var text: String
        var type: Hero
    }

enum Hero: Character
{
        case Superman = "👱‍♂️", Batman = "🦇", WonderWoman = "👱‍♀️", Flash = "⚡️"
        
        var definition: String
            {
                switch self
                    {
                        case .Superman:
                            return "It's a bird ... it's a plane, it's Superman!"
        
                        case .Batman:
                            return "I am Vengance! I am the night! I am Batman!"
        
                        case .WonderWoman:
                            return "Fighting for justice!"
        
                        case .Flash:
                            return "Run Barry, run!"
                    }
            }
    }
