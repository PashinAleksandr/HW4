//
//  RootViewController.swift
//  quiz
//
//  Created by Aleksandr Pashin on 17.07.2021.
//

import UIKit
class RootViewController: UIViewController {
    @IBAction func goToQuiz(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let quizViewController = mainStoryboard.instantiateViewController(identifier: "QuizViewController")
        show(quizViewController, sender: nil)
    }
    @IBAction func goToSattings(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let sattingsViewController = mainStoryboard.instantiateViewController(identifier: "SettingsViewController")
       present(sattingsViewController, animated: true)
    }
}
