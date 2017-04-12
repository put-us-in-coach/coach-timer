//
//  GameViewController.swift
//  Coach Timer
//
//  Created by Sergelenbaatar Tsogtbaatar on 4/11/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var rosterCollectionView: UICollectionView!
    
    
    
    var activePlayer = [Player]()
    
    var activeRoster = Team.shared.activeRoster
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let playaNib = UINib(nibName: "activePlayerCell", bundle: nil)
        self.collectionView.register(playaNib, forCellWithReuseIdentifier: "activePlayerCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
}
    
    
extension GameViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return activeRoster.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "activePlayerCell", for: indexPath) as! activePlayerCell
            
        cell.imageView.image = activeRoster[indexPath.row].photo
        cell.name.text = activeRoster[indexPath.row].name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "didSelectItemAtIndexPath:", message: "Indexpath = \(indexPath)", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Dismiss", style: .destructive, handler: nil)
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        
        
    }
    
    
   
}

extension GameViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: collectionView.frame.size.width/3.0 - 8, height: collectionView.frame.size.width/3.0 - 8)
    }
    
}
