//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 01.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать массив с ответами на этот экран
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавится от кнопки back
    
    // MARK: - IB Outlets
    
    
    @IBOutlet weak var typAnimalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Private properties
    var dogCaunt = 0
    var catCaunt = 0
    var rabbitCaunt = 0
    var turtleCaunt = 0
    var answersChoosenResults: [Answer] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        printResponse(answers: answersChoosenResults)
    }
    
    
    
    // MARK: - Private methods
    
   private func printResponse (answers: [Answer])  {
        // Записываем в счетчики количесво животных в массиве
        for caunter in answers {
            if caunter.type == .dog {
                dogCaunt += 1
            } else if caunter.type == .cat {
                catCaunt += 1
            } else if caunter.type == .rabbit {
                rabbitCaunt += 1
            } else if caunter.type == .turtle {
                turtleCaunt += 1
            }
        }
        // Определяем какое животное преобладает, выводим результат
        if dogCaunt > catCaunt, dogCaunt > rabbitCaunt, dogCaunt > turtleCaunt {
            typAnimalLabel.text = "Вы - \(AnimalType.dog.rawValue)"
            descriptionLabel.text = AnimalType.dog.definition
            
        } else if catCaunt > dogCaunt, catCaunt > rabbitCaunt, catCaunt > turtleCaunt {
            typAnimalLabel.text = "Вы - \(AnimalType.cat.rawValue)"
            descriptionLabel.text = AnimalType.cat.definition
            
        } else if rabbitCaunt > dogCaunt, rabbitCaunt > catCaunt, rabbitCaunt > turtleCaunt {
            typAnimalLabel.text = "Вы - \(AnimalType.rabbit.rawValue)"
            descriptionLabel.text = AnimalType.rabbit.definition
            
        } else if turtleCaunt > dogCaunt, turtleCaunt > rabbitCaunt, turtleCaunt > catCaunt {
            typAnimalLabel.text = "Вы - \(AnimalType.turtle.rawValue)"
            descriptionLabel.text = AnimalType.turtle.definition
        }
    }
}


