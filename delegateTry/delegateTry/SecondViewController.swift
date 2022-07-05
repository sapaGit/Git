//
//  SecondViewController.swift
//  delegateTry
//
//  Created by Sergey Pavlov on 21.06.2022.
//

import UIKit
protocol SecondViewControllerDelegate: AnyObject {
    func valueWasChanged(data: String)
}

class SecondViewController: UIViewController {
    
    weak var delegate: SecondViewControllerDelegate?
    
    var score = 0
  
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "0"
    }
    
    @IBAction func pluslTapped(_ sender: UIButton) {
        score += 1
        label.text = "\(score)"
        delegate?.valueWasChanged(data: String(score))
    }
    @IBAction func minusTapped(_ sender: UIButton) {
        score -= 1
        label.text = "\(score)"
        delegate?.valueWasChanged(data: String(score))
    }
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
