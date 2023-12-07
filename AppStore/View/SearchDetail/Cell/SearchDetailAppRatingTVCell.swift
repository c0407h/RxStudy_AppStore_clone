//
//  SearchDetailAppRatingTVCell.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/19.
//

import UIKit

class SearchDetailAppRatingTVCell: BaseTableviewCell {

    @IBOutlet weak var reviewTotalCountLabel: UILabel!
    @IBOutlet weak var ratingNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(reviewCnt: Int, ratingNum: Double) {
        self.ratingNumberLabel.text = String(format: "%.1f",  ratingNum)
        self.reviewTotalCountLabel.text = "\(reviewCnt.reviewCount()) 개의 평가"
    }
    
}
