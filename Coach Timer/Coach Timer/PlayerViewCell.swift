//
//  PlayerViewCell.swift
//  Coach Timer
//
//  Created by Sergelenbaatar Tsogtbaatar on 4/10/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import UIKit

class PlayerViewCell: UITableViewCell {

    
    var player: Player! {
        didSet {
            self.nameLabel.text = player.name
            self.currentPlayTime.text = String(describing: player.currentPlayTime)
            self.isPresent.text = String(describing: player.isPresent)
//          self.avgPlayTime.text = String(describing: player.avgPlayTime)
            self.avgPlayTime.text = String(describing: player.totalPlayTime)
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
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
