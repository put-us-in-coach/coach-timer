//
//  ActivePlayerCollectionCell.swift
//  Coach Timer
//
//  Created by Regenal Grant on 4/12/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import UIKit

class ActivePlayerCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    var activePlayer: Player? {
        didSet {
            self.imageView.image = activePlayer?.photo
            self.nameLabel.text = activePlayer?.name
            guard var seconds = (activePlayer?.currentPlayTime) else { return }
            let s = String(format: "%02d:%02d", Int(seconds/60%100), Int(seconds%60))
            self.timerLabel.text = "\(s)"
            self.timerLabel.isHidden = false
            if activePlayer == nil {
                self.alpha = 0.4
            } else {
                self.alpha = 1.0
            }
        }
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.nameLabel.text = nil
        self.timerLabel.text = nil
        self.imageView.image = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
