//
//  SegueTesViewController.swift
//  quiz
//
//  Created by Aleksandr Pashin on 18.07.2021.
//

import UIKit

class SegueTestViewController: UIViewController {
    
    @IBAction func buttonDidTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "openNextController", sender: nil)
    }
    
}
class HMSegueTestViewController: UIViewController {
    
    @IBAction func buttonGoToFirst(_ sender: UIButton) {
        performSegue(withIdentifier: "openSecondController", sender: nil)
    }
    @IBAction func buttonGoToFoth(_ sender: UIButton) {
        performSegue(withIdentifier: "openFothsController", sender: nil)
    }
    @IBAction func buttonGoToFirst1(_ sender: UIButton) {
        performSegue(withIdentifier: "openFirst1Controller", sender: nil)
    }
    @IBAction func buttonGoToThird(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToThirdController", sender: nil)
    }
    @IBAction func buttonGoToFive(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToFiveController", sender: nil)
    }
    @IBAction func buttonGoToFirst2(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToFirst2Controller", sender: nil)
    }
    

    @IBAction func unwind(segue: UIStoryboardSegue) {}
}
