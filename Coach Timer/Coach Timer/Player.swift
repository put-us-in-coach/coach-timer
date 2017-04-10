//
//  Player.swift
//  Coach Timer
//
//  Created by Regenal Grant on 4/10/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import UIKit

enum FieldPosition {
    case goalie
    case defense
    case forward
    case midfield
}

class Player {
    
    let name: String
    let photo: UIImage?
    var isPresent = false
    var currentPlayTime = 0.0
    var totalPlayTime = 0.0
    var totalGameTime = 0.0
    var notes: String
    var position = Set<FieldPosition>()
    
    init(name:String, photo:UIImage? = nil, notes:String = "", position:Set<FieldPosition>=[]) {
        self.name = name
        self.photo = photo
        self.notes = notes
        self.position = position
    }
    
}
