//
//  SearchDetailAppScreenShotTVCell.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/19.
//

import UIKit

class SearchDetailAppScreenShotTVCell: BaseTableviewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var screenShot: [String] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        registCell()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func registCell() {
        self.collectionView.register(name: "SearchDetailAppScreenShotCVCell")
    }
    
    func setData(screenShot: [String]) {
        self.screenShot = screenShot
        
    }
}

extension SearchDetailAppScreenShotTVCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.screenShot.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: SearchDetailAppScreenShotCVCell = collectionView.loadCell(indexPath: indexPath) {
            cell.setData(screenShot: self.screenShot[indexPath.row])
            
            return cell
        }
        return UICollectionViewCell()
    }
}
