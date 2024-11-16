//
//  quizViewController.swift
//  quiz
//
//  Created by Aleksandr Pashin on 19.05.2021.
//

import UIKit



class QuizViewController: UIViewController {
    
    
    var questionOne: Question = Question(image: UIImage.init(named: "Old_(film)_poster")!, question: "Рейтинг этого фильма выше 5 на IMDb?", questionAnswer: "Да",rightButton: "Да",leftButton: "Нет", nameOfQuastions: "1")
    var questionTwo: Question = Question(image: UIImage.init(named: "Tesla")!, question: "Рейтинг этого фильма выше 8 на IMDb?", questionAnswer: "Да", rightButton: "Да", leftButton: "Нет", nameOfQuastions: "2")
    var questionThree: Question = Question(image: UIImage.init(named: "avengers")!, question: "Рейтинг этого фильма ниже 5 на IMDb?", questionAnswer: "Нет", rightButton: "Да", leftButton: "Нет", nameOfQuastions: "3")
    var questionFour: Question = Question(image: UIImage.init(named: "Default 1")!, question: "Рейтинг этого фильма выше 5 на IMDb?", questionAnswer: "Нет", rightButton: "Да", leftButton: "Нет", nameOfQuastions: "4")
    var qustionFive: Question = Question(image: UIImage.init(named: "Default")!, question: "Рейтинг этого фильма выше 5 на IMDb?", questionAnswer: "Да", rightButton: "Нет", leftButton: "Нет", nameOfQuastions: "5")
    var questionSix: Question = Question(image: UIImage.init(named: "godFather")!, question: "Рейтинг этого фильма выше 5 на IMDb?", questionAnswer: "Да", rightButton: "Да", leftButton: "Нет", nameOfQuastions: "6")
    var questionSeven: Question = Question(image: UIImage.init(named: "green knight")!, question: "Рейтинг этого фильма выше 9 на IMDb?", questionAnswer: "Нет",rightButton: "Нет", leftButton: "Нет", nameOfQuastions: "7")
    var questionEight: Question = Question(image: UIImage.init(named: "ice age")!, question: "Рейтинг этого фильма выше 5 на IMDb?", questionAnswer: "Нет", rightButton: "Да", leftButton: "Нет", nameOfQuastions: "8")
    var questionNine: Question = Question(image: UIImage.init(named: "vivarium")!, question: "Рейтинг этого фильма выше 5 на IMDb?", questionAnswer: "Да",rightButton: "Да", leftButton: "Нет", nameOfQuastions: "9")
    
    
    
    private var questionArray: [Question] = []
    private var numberOfQuestion: Int = 0
    private var score: Int = 0
    private var numberOfCorrectAnswers: Int = 0
    
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var leftTextButton: UIButton!
    @IBOutlet weak var rightTextButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionArray = [questionOne, questionTwo, questionThree, questionFour, qustionFive, questionSix, questionSeven, questionEight, questionNine]
        
        let question = questionArray[0]
        display(question: question)
        upDateScore()
        viewIsReady()
    }
    
    @IBAction private func didAnswer(_ sender: UIButton) {
        questionImage.layer.masksToBounds = true
        questionImage.layer.borderWidth = 8
        questionImage.layer.borderColor = isCorrect(sender) ? UIColor.ypGreen.cgColor : UIColor.ypRed.cgColor
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
            
            if self.numberOfQuestion + 1 >= self.questionArray.count {
                self.showAlert(title: "Этот раунд окончен! \n Хочешь начать заново?", massege: "Твой результат:\(self.numberOfCorrectAnswers) из \(self.questionArray.count) \n Ваш счет: \(self.score)")
                
            } else {
                self.questionImage.layer.borderColor = UIColor.clear.cgColor
                self.numberOfQuestion += 1
                
                let question = self.questionArray[self.numberOfQuestion]
                self.display(question: question)
                
                self.upDateScore()
            }
        }
    }
    private func isCorrect(_ sender: UIButton) -> Bool {
        if questionArray[numberOfQuestion].questionAnswer == sender.titleLabel?.text {
            increaseScore()
            return true
        } else {
            return false
        }
    }
    private func display(question: Question) {
        questionLabel.text = question.question
        questionImage.image = question.image
        
        let randomNumber = Int.random(in: 0...questionArray.count-1)
        if randomNumber == 1 {
            let rightAnswer: String = question.rightButton
            leftTextButton.setTitle(rightAnswer, for: .normal)
            let wrongAnswer: String = question.leftButton
            rightTextButton.setTitle(wrongAnswer, for: .normal)
        } else {
            let wrongAnswer: String = question.leftButton
            leftTextButton.setTitle(wrongAnswer, for: .normal)
            let rightAnswer: String = question.rightButton
            rightTextButton.setTitle(rightAnswer, for: .normal)
        }
    }
    
    private func increaseScore() {
        score += 10
        numberOfCorrectAnswers += 1
        
        
    }
    
    private func upDateScore() {
        scoreLabel.text = score.description
        questionNumber.text = "Вопрос:"
        scoreLabel.text =  "\(numberOfQuestion + 1) / \(questionArray.count)"
    }
    
    func viewIsReady() {
        questionImage.layer.masksToBounds = true
        questionImage.layer.borderWidth = 8
        questionImage.layer.cornerRadius = 20
        questionImage.layer.borderColor = UIColor.clear.cgColor
        
    }
    
    func showAlert(title: String, massege: String) {
        let alert = UIAlertController(title: title, message: massege, preferredStyle: .alert)
        let okActions = UIAlertAction(title: "Yes", style: .default) { _ in
            self.startNewGame()
            
        }
        let noActions = UIAlertAction(title: "No", style: .default)
        alert.addAction(okActions)
        alert.addAction(noActions)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    private func startNewGame() {
        numberOfQuestion = 0
        scoreLabel.text = "\(numberOfQuestion + 1) / \(questionArray.count)"
        score = 0
        numberOfCorrectAnswers = 0
        let question = questionArray[numberOfQuestion]
        display(question: question)
        
    }
    
}

extension QuizViewController {
    struct Question {
        var image: UIImage
        var question: String
        var questionAnswer: String
        var rightButton: String
        var leftButton: String
        var nameOfQuastions: String
    }
}
