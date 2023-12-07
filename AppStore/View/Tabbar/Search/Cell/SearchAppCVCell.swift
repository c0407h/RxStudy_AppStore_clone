//
//  SearchAppCVCell.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/19.
//

import UIKit
import Kingfisher

class SearchAppCVCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    func setData(screenShot: String) {
        if let url = URL(string: screenShot) {
            self.imageView.kf.setImage(with: url)
        }
    }
}
