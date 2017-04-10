//
//  Team.swift
//  Coach Timer
//
//  Created by Regenal Grant on 4/10/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import Foundation

class Team {
    
    var players: [Player]
    var games: [Game]
    var avgPlayTime = 0.0
    var totalGameTime = 0.0
    
    init() {
        self.players = []
        self.games = []
        
    }
    
}
