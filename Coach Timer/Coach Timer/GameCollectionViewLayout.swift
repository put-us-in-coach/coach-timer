//
//  GameCollectionViewLayout.swift
//  Coach Timer
//
//  Created by Sergelenbaatar Tsogtbaatar on 4/12/17.
//  Copyright © 2017 Put Us In Coach. All rights reserved.
//

import UIKit

class GameCollectionViewLayout: UICollectionViewFlowLayout {

    func viewDidLayoutSubviews() {
        viewDidLayoutSubviews()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 67, height: 67)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.headerReferenceSize = CGSize(width: 0, height: 40)
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionView?.collectionViewLayout = layout
    }
    
}
