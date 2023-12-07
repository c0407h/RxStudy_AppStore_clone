//
//  RecentSearchContentsTVCell.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/16.
//

import UIKit

class RecentSearchContentsTVCell: BaseTableviewCell {

    @IBOutlet weak var searchTxtLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func settingCell(searchTxt: String) {
        self.searchTxtLabel.text = searchTxt
    }
    
}
