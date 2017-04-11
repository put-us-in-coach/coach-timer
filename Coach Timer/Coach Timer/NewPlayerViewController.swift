//
//  NewPlayerViewController.swift
//  Coach Timer
//
//  Created by Robert Hatfield on 4/10/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import UIKit

class NewPlayerViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var playerImage: UIImageView!
    
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

}

extension NewPlayerViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
