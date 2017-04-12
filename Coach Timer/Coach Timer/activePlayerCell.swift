//
//  activePlayerCell.swift
//  Coach Timer
//
//  Created by Sergelenbaatar Tsogtbaatar on 4/11/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import UIKit

class activePlayerCell: UICollectionViewCell {

    var player: Player {
        didSet {
            self.name.text = player.name
            self.imageView.image = player.photo
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.imageView.translatesAutoresizingMaskIntoConstraints = false
//        
//        self.addSubview(self.imageView)
//        
//        self.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
//        self.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
//        self.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
//        self.addConstraint(NSLayoutConstraint(item: self.imageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.makeItCircle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeItCircle() {
        self.imageView.layer.masksToBounds = true
        self.imageView.layer.cornerRadius  = CGFloat(roundf(Float(self.imageView.frame.size.width/2.0)))
    }    
}
