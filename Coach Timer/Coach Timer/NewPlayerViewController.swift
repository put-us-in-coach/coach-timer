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
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet var positionForm: [UISwitch]!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//MARK: User actons
    
    func createPlayer() -> Player {
        
        var positions = [String: Bool]()
        
        if positionForm[0].isOn {
            positions["Defense"] = true
        } else {
            positions["Defense"] = false
        }
        
        if positionForm[1].isOn {
            positions["Goalie"] = true
        } else {
            positions["Goalie"] = false
        }
        
        if positionForm[2].isOn {
            positions["Midfield"] = true
        } else {
            positions["Midfield"] = false
        }
        
        if positionForm[3].isOn {
            positions["Forward"] = true
        } else {
            positions["Forward"] = false
        }
        
        let currentPlayer = Player(name: nameField.text!, photo: playerImageView.image!, notes: notesTextView.text, positions: positions)
        
        
        Team.shared.activeRoster.append(currentPlayer)
        print("\(String(describing: Team.shared.activeRoster.last))")

        return currentPlayer
    }
    
    @IBAction func saveButton(_ sender: Any) {
        currentPlayer = createPlayer()
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addPlayerImage(_ sender: Any) {
        print("Player image tapped")
        self.presentActionSheet()
    }
    

    
}

//MARK: Image picker extension
extension NewPlayerViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func presentImagePickerWith(sourceType: UIImagePickerControllerSourceType) {
        self.imagePicker.delegate = self
        self.imagePicker.sourceType = sourceType
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let previousImage = playerImageView.image
        if let playerImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            self.playerImageView.image = playerImage
        } else {
            self.playerImageView.image = previousImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }

    
    func presentActionSheet() {
        let actionSheetController = UIAlertController(title: "Image Source", message: "Please select image source.", preferredStyle: .actionSheet)
        
        typealias sourceAction = (title: String, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?, conditional: Bool?)
        
        let cameraAction: sourceAction = (title: "Camera", style: .default, handler: {(UIAlertAction) in
            self.presentImagePickerWith(sourceType: .camera)
            self.imagePicker.allowsEditing = true}, conditional: UIImagePickerController.isSourceTypeAvailable(.camera)
        )
        let photoAction: sourceAction = (title: "Photo Library", style: .default, handler: {(UIAlertAction) in
            self.presentImagePickerWith(sourceType: .photoLibrary)
            self.imagePicker.allowsEditing = true}, conditional: UIImagePickerController.isSourceTypeAvailable(.photoLibrary))
        
        let cancelAction: sourceAction = (title:"Cancel", style: .destructive, handler: nil, conditional: UIDevice.current.userInterfaceIdiom != UIUserInterfaceIdiom.pad)
        
        let sourceActions = [cameraAction, photoAction, cancelAction]
        
        if let popover = actionSheetController.popoverPresentationController {
            popover.sourceView = playerImageView
            popover.sourceRect = playerImageView.bounds
            popover.permittedArrowDirections = .init(rawValue: 0)
        }
        
        for actionDefinition in sourceActions {
            let action = UIAlertAction(title: actionDefinition.title, style: actionDefinition.style, handler: actionDefinition.handler)
            if actionDefinition.conditional == true { actionSheetController.addAction(action) }
        }
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
}


//MARK: Text field delegate extension
extension NewPlayerViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
