//
//  ResoltViewController.swift
//  quiz
//
//  Created by Aleksandr Pashin on 14.07.2021.
//

import UIKit

class ResoltViewController: UIViewController {
    var score: Int!
    @IBOutlet weak var resolvedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        resolvedLabel.text = score.description
    }
    
}
