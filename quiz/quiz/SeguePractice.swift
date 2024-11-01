//
//  SeguePractice.swift
//  quiz
//
//  Created by Aleksandr Pashin on 07.07.2021.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func openNewModule(_ sender: Any) {

        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        vc.text = textField.text
        //present(vc, animated: true)
        //navigationController?.pushViewController(vc, animated: true)
        
        show(vc, sender: nil)
    }
}

class SecondViewController: UIViewController {
    var text: String?
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = text
    }
}
