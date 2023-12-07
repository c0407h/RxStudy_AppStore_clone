//
//  SearchTxtMatchingTVCell.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/17.
//

import UIKit
import RxSwift

class SearchTxtMatchingTVCell: BaseTableviewCell {
    @IBOutlet weak var searchTxtLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func settingCell(searchTxt: String) {
        self.searchTxtLabel.text = searchTxt
    }
    
}
