//
//  SearchDetailAppNewsTVCell.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/19.
//

import UIKit

class SearchDetailAppNewsTVCell: BaseTableviewCell {
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var beforeUpdateLabel: UILabel!
    @IBOutlet weak var updateInfoLabel: UILabel!
    
    @IBOutlet weak var moreButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(updateInfo: String, version: String, date: String) {
        versionLabel.text = "버전 \(version)"
        updateInfoLabel.text = updateInfo
        if let updateDate = date.toDate(format: "yyyy-MM-dd'T'HH:mm:ssZ") {
            beforeUpdateLabel.text = Date().offset(from: updateDate)
        }
        if self.updateInfoLabel.numberOfLines == 3 {
            self.moreButton.isHidden = false
        } else {
            self.moreButton.isHidden = true
        }
    }
    
    @IBAction func touchMore(_ sender: Any) {
        self.updateInfoLabel.numberOfLines = 0
        self.moreButton.isHidden = true
        self.layoutIfNeeded()
        self.parentTableView?.beginUpdates()
        self.parentTableView?.endUpdates()
    }
    
}
