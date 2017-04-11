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
    
    var roster = Team.shared.activeRoster{
        
        didSet {
            tableView.reloadData()
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
      
        let playerNib = UINib(nibName: "PlayerViewCell", bundle: nil)
        self.tableView.register(playerNib, forCellReuseIdentifier: "PlayerViewCell")
        
        self.tableView.estimatedRowHeight = 64
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    @IBAction func returnToRoster(sender: UIStoryboardSegue){
        if let sourceViewController = sender.source as? NewPlayerViewController, let player = sourceViewController.currentPlayer {
            let newIndexPath = IndexPath(row: roster.count, section: 0)
            roster.append(player)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        
    }

    

}

extension TeamRosterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerViewCell", for: indexPath) as! PlayerViewCell
        
        cell.player = self.roster[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return roster.count
    }
    
    
}
