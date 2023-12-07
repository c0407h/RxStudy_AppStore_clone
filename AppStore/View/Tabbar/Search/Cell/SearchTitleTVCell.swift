//
//  SearchTitleTVCell.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/16.
//

import UIKit

class SearchTitleTVCell: BaseTableviewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func settingCell(title: String){
        titleLabel.text = title
    }
    
}
