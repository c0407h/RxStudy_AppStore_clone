//
//  SearchAppTVCell.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/16.
//

import UIKit
import Kingfisher
import Cosmos

class SearchAppTVCell: BaseTableviewCell {
    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var downLoadBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var appDiscrip: UILabel!
    @IBOutlet weak var userRate: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    var screenShot:[String] = []
    

    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        setUI()
        registCell()
        ratingView.settings.fillMode = .precise
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func setUI() {
        appIconImageView.layer.masksToBounds = true
        appIconImageView.layer.cornerRadius = 15
        appIconImageView.layer.borderWidth = 1
        appIconImageView.layer.borderColor = UIColor.systemGray5.cgColor
        downLoadBtn.layer.masksToBounds = true
        downLoadBtn.layer.cornerRadius = downLoadBtn.frame.height / 2
        
    }
    
    func setData(app: App) {
        if let url = URL(string: app.artworkUrl512) {
            appIconImageView.kf.setImage(with: url)
        }
        
        self.ratingView.rating = app.averageUserRating
        self.screenShot = app.screenshotUrls
        self.appTitle.text = app.trackName
        self.appDiscrip.text = app.sellerName
        self.userRate.text = (app.userRatingCount).reviewCount()
        
        
        
        self.collectionView.reloadData()
        self.layoutIfNeeded()
        parentTableView?.beginUpdates()
        parentTableView?.endUpdates()
        
    }
    
    func registCell() {
        collectionView.register(name: "SearchAppCVCell")
    }
    
}

extension SearchAppTVCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: SearchAppCVCell = collectionView.loadCell(indexPath: indexPath) {
            cell.setData(screenShot: self.screenShot[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 108, height: 232)
    }
    
}
