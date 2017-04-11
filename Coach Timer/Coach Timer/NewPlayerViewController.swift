//
//  NewPlayerViewController.swift
//  Coach Timer
//
//  Created by Robert Hatfield on 4/10/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import UIKit

class NewPlayerViewController: UIViewController {

    var currentPlayer: Player?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet var positionForm: [UISwitch]!
    @IBOutlet weak var playerView: UIImageView!
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
//MARK: Navigation
    
    func instantiatePlayer() -> Player {
        
        var tempPosition = [String: Bool]()
        
        if positionForm[0].isOn {
            tempPosition["Defense"] = true
        } else {
            tempPosition["Defense"] = false
        }
        
        if positionForm[1].isOn {
            tempPosition["Goalie"] = true
        } else {
            tempPosition["Goalie"] = false
        }
        
        if positionForm[2].isOn {
            tempPosition["Midfield"] = true
        } else {
            tempPosition["Midfield"] = false
        }
        
        if positionForm[3].isOn {
            tempPosition["Forward"] = true
        } else {
            tempPosition["Forward"] = false
        }
        
        let currentPlayer = Player(name: nameField.text!, photo: playerView.image, notes: notesTextView.text, positions: tempPosition)
        
        //        TeamRosterViewController.tableView(
        
//        Team.shared.activeRoster.append(currentPlayer)
        print("\(Team.shared.activeRoster.last)")

        return currentPlayer
    }
    
    @IBAction func saveButton(_ sender: Any) {
        currentPlayer = instantiatePlayer()
        self.dismiss(animated: true, completion: nil)
    }

    //MARK: Action
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    
    
    }
}

    
    
//        savePlayerToRoster()


    
//    func savePlayerToRoster() {
//        
//       
//    }
    
    



extension NewPlayerViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
