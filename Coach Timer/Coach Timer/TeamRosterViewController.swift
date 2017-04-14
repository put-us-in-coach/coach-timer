//
//  TeamRosterViewController.swift
//  Coach Timer
//
//  Created by Sergelenbaatar Tsogtbaatar on 4/10/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import UIKit

class TeamRosterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let generator = UIImpactFeedbackGenerator(style: .heavy)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.isEditing = true
        
        let playerNib = UINib(nibName: "PlayerTableCell", bundle: nil)
        self.tableView.register(playerNib, forCellReuseIdentifier: "PlayerTableCell")
        
        self.tableView.estimatedRowHeight = 80.5
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func gameButtonPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }

}

extension TeamRosterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableCell", for: indexPath) as! PlayerTableCell
        
        cell.player = Team.shared.activeRoster[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                generator.impactOccurred()
        
//        let feedback = UISelectionFeedbackGenerator()
//        feedback.selectionChanged()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Team.shared.activeRoster.count
    }
    
    
     func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
     func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
     func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = Team.shared.activeRoster[sourceIndexPath.row]
        Team.shared.activeRoster.remove(at: sourceIndexPath.row)
        Team.shared.activeRoster.insert(movedObject, at: destinationIndexPath.row)
        NSLog("%@", "\(sourceIndexPath.row) => \(destinationIndexPath.row) \(Team.shared.activeRoster)")
        // To check for correctness enable: self.tableView.reloadData()
    }
    
}
