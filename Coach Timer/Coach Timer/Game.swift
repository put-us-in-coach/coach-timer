//
//  Game.swift
//  Coach Timer
//
//  Created by Regenal Grant on 4/10/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import Foundation

class Game {
    
    var activeRoster = [Player]()
    var totalGameTime = 0.0
    var positions: [String: Player?]
    var avgPlayTime = 0.0
    
    init() {
        positions = ["goalie": nil, "leftDefense": nil, "rightDefense": nil, "leftMidField": nil, "rightMidField": nil, "forward": nil]
        self.activeRoster = []
        
    }
    
}
