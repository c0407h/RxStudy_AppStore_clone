//
//  SearchDetailAppScreenShotCVCell.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/19.
//

import UIKit
import Kingfisher

class SearchDetailAppScreenShotCVCell: UICollectionViewCell {
    @IBOutlet weak var screenShotImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    func setData(screenShot: String) {
        screenShotImageView.layer.masksToBounds = true
        screenShotImageView.layer.cornerRadius = 20
        screenShotImageView.layer.borderWidth = 1
        screenShotImageView.layer.borderColor = UIColor.systemGray5.cgColor
        self.screenShotImageView.kf.setImage(with: URL(string: screenShot))
    }
    
}
