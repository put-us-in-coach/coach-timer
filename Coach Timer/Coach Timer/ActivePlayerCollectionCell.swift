//
//  ActivePlayerCollectionCell.swift
//  Coach Timer
//
//  Created by Regenal Grant on 4/12/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import UIKit

class ActivePlayerCollectionCell: UICollectionViewCell {
    
    var activePlayer: Player!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
