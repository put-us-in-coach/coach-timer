//
//  ActivePlayerCollectionCell.swift
//  Coach Timer
//
//  Created by Regenal Grant on 4/12/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import UIKit

class ActivePlayerCollectionCell: UICollectionViewCell {
    
    var activePlayer: Player? {
        didSet {
            print(activePlayer?.name)
            self.imageView.image = activePlayer?.photo
            if activePlayer == nil {
                self.alpha = 0.1
            } else {
                self.alpha = 1.0
            }
            
        }
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
