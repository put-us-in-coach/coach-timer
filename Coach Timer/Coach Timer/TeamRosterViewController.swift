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

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
      
        let playerNib = UINib(nibName: "PlayerViewCell", bundle: nil)
        self.tableView.register(playerNib, forCellReuseIdentifier: "PlayerViewCell")
        
        self.tableView.estimatedRowHeight = 64
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    

}

extension TeamRosterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerViewCell", for: indexPath) as! PlayerViewCell
        
        cell.player = Team.shared.activeRoster[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Team.shared.activeRoster.count
    }
    
    
}
