//
//  HW переходы.swift
//  quiz
//
//  Created by Aleksandr Pashin on 11.07.2021.
//

import UIKit

class FirstScreen: UIViewController {
    
    var number: Int = 5
    
    @IBAction func goPush(_ sender: Any) {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = mainStoryboard.instantiateViewController(identifier: "SecondScreen") as! SecondScreen
        secondViewController.number = number
        show(secondViewController, sender: nil)
    }
    
}

class SecondScreen: UIViewController {
    var number: Int = 0
    
    @IBAction func MuveModal(_ sender: Any) {
        let mainStorybord = UIStoryboard(name: "Main", bundle: nil)
        let тherdViewController = mainStorybord.instantiateViewController(identifier: "TherdScreen") as! TherdScreen
        present(тherdViewController, animated: true)
        //navigationController!.pushViewController(TherdViewController, animated: true)
    }
    
}

class TherdScreen: UIViewController {
    
}
