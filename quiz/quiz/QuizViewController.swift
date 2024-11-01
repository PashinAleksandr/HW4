//
//  quizViewController.swift
//  quiz
//
//  Created by Aleksandr Pashin on 19.05.2021.
//

import UIKit



class QuizViewController: UIViewController {
   
    
    var questionOne: Question = Question(image: UIImage.init(named: "Old_(film)_poster")!, question: "Как звали мужа в Фильме Old?", questionAnswer: "Гай",rightButton: "Гай",leftButton: "Дейв", nameOfQuastions: "1")
    var questionTwo: Question = Question(image: UIImage.init(named: "Tesla")!, question: "Кто изобрел телефон?", questionAnswer: "Белл", rightButton: "Белл", leftButton: "Тесла", nameOfQuastions: "2")
    var questionThree: Question = Question(image: UIImage.init(named: "avengers")!, question: "Кто повредил глаз Фьюри?", questionAnswer: "Флеркин", rightButton: "Кот", leftButton: "Флеркин", nameOfQuastions: "3")
    var questionFour: Question = Question(image: UIImage.init(named: "Default 1")!, question: "Куда несут кольцо?", questionAnswer: "В Мордер", rightButton: "К Саурону", leftButton: "В Мордер", nameOfQuastions: "4")
    var qustionFive: Question = Question(image: UIImage.init(named: "Default")!, question: "Какой рейтинг у этого фильма на IMDb?", questionAnswer: "3.6", rightButton: "5.6", leftButton: "3.6", nameOfQuastions: "5")
    var questionSix: Question = Question(image: UIImage.init(named: "godFather")!, question: "Кто по национальности главные герои?", questionAnswer: "Итальянци", rightButton: "Американци", leftButton: "Итальянци", nameOfQuastions: "6")
    var questionSeven: Question = Question(image: UIImage.init(named: "green knight")!, question: "Сдержал ли слово главный герой?", questionAnswer: "Да",rightButton: "Да", leftButton: "Нет", nameOfQuastions: "7")
    var questionEight: Question = Question(image: UIImage.init(named: "ice age")!, question: "Кто пукает тот идет...", questionAnswer: "Последний", rightButton: "После Бака", leftButton: "Последний", nameOfQuastions: "8")
    var questionNine: Question = Question(image: UIImage.init(named: "vivarium")!, question: "В каком году вышел этот фильм", questionAnswer: "2019",rightButton: "2018", leftButton: "2019", nameOfQuastions: "9")


    
    var array: [Question] = []
    var numbOfQuestion: Int = 0
    var score: Int = 0
    var nunberOfCorrectAnswers: Int = 0
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var leftTextButton: UIButton!
    @IBOutlet weak var rightTextButton: UIButton!
    @IBOutlet weak var qustionLabel: UILabel!
    @IBOutlet weak var questionImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        array = [questionOne, questionTwo, questionThree, questionFour, qustionFive, questionSix, questionSeven, questionEight, questionNine]

        let question = array[0]
        display(question: question)
        upDateScore()
        viewIsRD()
    }
    
    @IBAction func didAnswer(_ sender: UIButton) {
        if array[numbOfQuestion].questionAnswer == sender.titleLabel?.text {
            increaseScore()
            questionImage.layer.borderColor = UIColor.green.cgColor
        } else {
            questionImage.layer.borderColor = UIColor.red.cgColor
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            
      
    
            if self.numbOfQuestion + 1 >= self.array.count {
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            guard let resolvedViewController = mainStoryboard.instantiateViewController(identifier: "ResoltViewController") as? ResoltViewController else {
                return
            }

                resolvedViewController.score = self.score
                self.show(resolvedViewController, sender: nil)
            
                self.showAlert(title: "Этот раунд окончен! \n Хочешь начать заново?", massege: "Твой результат:\(self.nunberOfCorrectAnswers) из \(self.array.count) \n Ваш счет: \(self.score)")
            return
            }
            self.numbOfQuestion += 1
        
            let question = self.array[self.numbOfQuestion]
            self.display(question: question)
            self.questionImage.layer.borderColor = UIColor.blue.cgColor
            self.upDateScore()
        }
    }
    
    func display(question: Question) {
        qustionLabel.text = question.question
        questionImage.image = question.image
        
        let randomNumber = Int.random(in: 0...array.count-1)
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
    
    func increaseScore() {
        score += 10
        nunberOfCorrectAnswers += 1

        
    }
    
    func upDateScore() {
        scoreLabel.text = score.description
        questionNumber.text = "Вопрос \(numbOfQuestion + 1) из \(array.count)"
    }
    
    func viewIsRD() {
        questionImage.layer.masksToBounds = true
        questionImage.layer.borderWidth = 1
        questionImage.layer.borderColor = UIColor.blue.cgColor
        questionImage.layer.cornerRadius = 6
    }

    func showAlert(title: String, massege: String) {
        let alert = UIAlertController(title: title, message: massege, preferredStyle: .alert)
        let okActions = UIAlertAction(title: "Yes", style: .default) { _ in
            self.newGame()
            
        }
        let noActions = UIAlertAction(title: "No", style: .default)
        alert.addAction(okActions)
        alert.addAction(noActions)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func newGame() {
        numbOfQuestion = 0
        score = 0
        nunberOfCorrectAnswers = 0
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let quizViewController = mainStoryboard.instantiateViewController(identifier: "QuizViewController")
        show(quizViewController, sender: nil)
        
    }
    
}
