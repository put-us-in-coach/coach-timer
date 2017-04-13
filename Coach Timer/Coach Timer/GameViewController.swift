//
//  GameViewController.swift
//  Coach Timer
//
//  Created by Sergelenbaatar Tsogtbaatar on 4/11/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    
    var seconds = 0
    var minutes = 0
    var game = Game()
    var isTimerRunning = false
    var resumeTapped = false
    
    var timer = Timer()
    
    var activePlayer = [Player]()
    var activeRoster = Team.shared.activeRoster
    var selectedPlayer: Player?
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var rosterCollectionView: UICollectionView!
    @IBOutlet weak var fieldCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Not Crashing")
        self.fieldCollectionView.delegate = self
        self.fieldCollectionView.dataSource = self
        self.rosterCollectionView.delegate = self
        self.rosterCollectionView.dataSource = self
        
        let playaNib = UINib(nibName: "ActivePlayerCollectionCell", bundle: nil)
        self.fieldCollectionView.register(playaNib, forCellWithReuseIdentifier: "ActivePlayerCollectionCell")
        self.rosterCollectionView.register(playaNib, forCellWithReuseIdentifier: "ActivePlayerCollectionCell")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fieldCollectionView.reloadData()
    }
    
    @IBAction func stopWatch(_ sender: Any) {
        startTimer()
    }
    
    func startTimer() {
        if isTimerRunning {
            // Pause timer
            timer.invalidate()
            isTimerRunning = false
        } else {
            // Resume timer
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
            isTimerRunning = true
        }
    }
    
    
    func updateTimer() {
        seconds += 1
        if seconds > 60 {
            minutes += 1
            seconds = 0
        }
        let s = String(format: "%02d:%02d", Int(minutes%100), Int(seconds%100))
        self.timerLabel.text = "\(s)"
    }
    
    
    @IBAction func returnToRoster(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

class RosterButtonView: UICollectionReusableView {
    
}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var cellCount = 0
        
        if collectionView == rosterCollectionView {
            cellCount = activeRoster.count
        }
        
        if collectionView == self.fieldCollectionView {
            cellCount = 30
        }
        
        return cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivePlayerCollectionCell", for: indexPath) as! ActivePlayerCollectionCell
        
        
        
        if collectionView == rosterCollectionView {
            cell.activePlayer = activeRoster[indexPath.row]
            cell.imageView.image = activeRoster[indexPath.row].photo
            cell.nameLabel.text = activeRoster[indexPath.row].name
        } else {
            
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == rosterCollectionView {
            print("In the bench")
            guard let selectedIndex = self.rosterCollectionView.indexPathsForSelectedItems?.first else { return }
            
            selectedPlayer = activeRoster[selectedIndex.row]
            print("\(selectedPlayer?.name)")
            
        }
        
        if collectionView == self.fieldCollectionView {
            
            print("On the field")
        }
        
    }
    
}

