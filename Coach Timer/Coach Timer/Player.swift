//
//  Player.swift
//  Coach Timer
//
//  Created by Regenal Grant on 4/10/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import UIKit

class Player {
    
    let name: String
    let photo: UIImage
    var isPresent = false
    var currentPlayTime: Int
//    var totalPlayTime = 0.0
    var totalGameTime = 0.0
    var notes: String
    var positions: [String: Bool] = ["Goalie": false, "Defense": false, "Midfield": false, "Center": false]
    var onField = false
    var timerStart: Double?
    var timerStop: Double?
    var timePlayed = 0.0
    
//    var timer: Timer?
    
    init(name: String, photo: UIImage, notes: String = "",
         positions: [String: Bool] ) {
        self.name = name
        self.photo = photo
        self.notes = notes
        self.positions = positions
        self.currentPlayTime = 0
//        self.timer = Timer()
    }
    
}
