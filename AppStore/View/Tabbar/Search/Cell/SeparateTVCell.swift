//
//  SeparateTVCell.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/16.
//

import UIKit

class SeparateTVCell: BaseTableviewCell {

    @IBOutlet weak var separateHeight: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func settingCell(height: Int) {
        self.separateHeight.constant = CGFloat(height)
    }
    
}
