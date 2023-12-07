//
//  SearchDetailAppInfoTVCell.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/19.
//

import UIKit
import Cosmos

class SearchDetailAppInfoTVCell: BaseTableviewCell {
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var reviewStarView: CosmosView!
    @IBOutlet weak var cateogoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        reviewStarView.settings.fillMode = .precise
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(app:App) {
        let rating = app.averageUserRating
        self.ratingLabel.text = String(format: "%.1f",  rating)
        self.reviewStarView.rating = app.averageUserRating
        self.reviewLabel.text = "\((app.userRatingCount).reviewCount())개의 평가"
        self.cateogoryLabel.text = app.genres[0]
        self.ageLabel.text = app.trackContentRating
    }
    
}
