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
    
    var playersOnField = Array<Player?>(repeating: nil, count: 25)
    var activeRoster = Team.shared.activeRoster {
        didSet {
            rosterCollectionView.reloadData()

        }
    }
    var selectedPlayer: Player?
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var rosterCollectionView: UICollectionView!
    @IBOutlet weak var fieldCollectionView: UICollectionView!
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("will appear")
        rosterCollectionView.reloadData()
        self.navigationController?.isNavigationBarHidden = true
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
            if timerLabel.text == "TIMER" {
                timerLabel.text = "00:00"
            }
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
            isTimerRunning = true
        }
    }
    
    @IBAction func showRosterVCPressed(_ sender: Any) {
    
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
    
    @IBAction func longPressTimer(_ sender: UILongPressGestureRecognizer) {
        timer.invalidate()
        isTimerRunning = false
        seconds = 0
        minutes = 0
        timerLabel.text = "00:00"
    }
    
    
    @IBAction func returnToRoster(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

class RosterButtonView: UICollectionReusableView {
    
}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var cellCount = 0
        
        if collectionView == rosterCollectionView {
            cellCount = Team.shared.activeRoster.count
        }
        
        if collectionView == self.fieldCollectionView {
            cellCount = 25
        }
        
        return cellCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActivePlayerCollectionCell", for: indexPath) as! ActivePlayerCollectionCell
        
        
        
        if collectionView == rosterCollectionView {
            cell.activePlayer = Team.shared.activeRoster[indexPath.row]
            cell.imageView.image = Team.shared.activeRoster[indexPath.row].photo
            cell.nameLabel.text = Team.shared.activeRoster[indexPath.row].name
        } else {
            if collectionView == fieldCollectionView {
                cell.activePlayer = playersOnField[indexPath.row]
            }
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == rosterCollectionView {
            print("On the bench")
            guard let selectedIndex = self.rosterCollectionView.indexPathsForSelectedItems?.first else { return }
            
            selectedPlayer = Team.shared.activeRoster.remove(at: selectedIndex.row)
            collectionView.reloadData()
            print("\(selectedPlayer?.name)")
            
        }
        
        if collectionView == self.fieldCollectionView {
            print("On the field")
            guard let selectedIndex = self.fieldCollectionView.indexPathsForSelectedItems?.first else { return }
            guard let player = playersOnField[selectedIndex.row] else {
                playersOnField[selectedIndex.row] = selectedPlayer
                fieldCollectionView.reloadData()
                selectedPlayer = nil
                return
            }
            selectedPlayer = player
            playersOnField[selectedIndex.row] = nil
            Team.shared.activeRoster.append(selectedPlayer!)
            collectionView.reloadData()
            rosterCollectionView.reloadData()
            print("\(String(describing: selectedPlayer?.name))")
            selectedPlayer = nil

        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        
        case UICollectionElementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,  withReuseIdentifier: "BenchCollectionHeaderView", for: indexPath) as! BenchCollectionHeaderView
        
            return headerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
        
}

