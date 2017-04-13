//
//  PlayerTableCell.swift
//  Coach Timer
//
//  Created by Sergelenbaatar Tsogtbaatar on 4/10/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import UIKit

class PlayerTableCell: UITableViewCell {

    
    var player: Player! {
        didSet {
            self.nameLabel.text = player.name
            self.playerImageView.image = player.photo
            self.currentPlayTime.text = "Played: \(player.currentPlayTime)"
            self.avgPlayTime.text = "Team avg: \(Team.shared.avgPlayTime)"
            self.isPresent.text = String(describing: player.isPresent)
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var currentPlayTime: UILabel!
    @IBOutlet weak var avgPlayTime: UILabel!
    @IBOutlet weak var isPresent: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
