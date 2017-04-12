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
        return Team.shared.activeRoster.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if let view = cell as? activePlayerCell {
            
            view.imageView.image = Team.shared.activeRoster[indexPath.row].photo
        }
        return cell
    }
    
    

   
}

extension GameViewController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.size.width/3.0 - 8, height: collectionView.frame.size.width/3.0 - 8)
//    }
    
}
