//
//  BaseTableviewCell.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/16.
//

import UIKit

class BaseTableviewCell: UITableViewCell {
    lazy var parentTableView: UITableView? = {
        var table: UIView? = superview
        while !(table is UITableView) && table != nil {
            table = table?.superview
        }
        return table as? UITableView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
