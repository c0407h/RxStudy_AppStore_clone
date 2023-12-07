//
//  SeachDetailAppDetailTVCell.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/19.
//

import UIKit

class SeachDetailAppDetailTVCell: BaseTableviewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var sellerLabel: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var sellerView: UIView!
        
    var sellerUrl = ""
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setData(description: String, seller: String,url: String) {
        self.descriptionLabel.text = description
        self.sellerLabel.text = seller
        self.sellerUrl = url
        
        if url.trimmingCharacters(in: .whitespaces) == "" {
            sellerView.isHidden = true
        } else {
            sellerView.isHidden = false
        }
        
        if self.descriptionLabel.numberOfLines == 3 {
            self.moreBtn.isHidden = false
        } else {
            self.moreBtn.isHidden = true
        }
    }
    
    @IBAction func touchMoreDescrip(_ sender: Any) {
        self.moreBtn.isHidden = true
        self.descriptionLabel.numberOfLines = 0
        self.layoutIfNeeded()
        self.parentTableView?.beginUpdates()
        self.parentTableView?.endUpdates()
    }
    
    @IBAction func touchSeller(_ sender: Any) {
        if let url = URL(string: self.sellerUrl) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    
    
}
