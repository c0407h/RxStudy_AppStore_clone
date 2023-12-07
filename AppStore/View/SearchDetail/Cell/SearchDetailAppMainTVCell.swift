//
//  SearchDetailAppMainTVCell.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/19.
//

import UIKit
import Kingfisher

class SearchDetailAppMainTVCell: BaseTableviewCell {

    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var appDescripLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUI() {
        appIconImageView.layer.masksToBounds = true
        appIconImageView.layer.cornerRadius = 20
        appIconImageView.layer.borderWidth = 1
        appIconImageView.layer.borderColor = UIColor.systemGray5.cgColor
    }
    
    func setData(app: App) {
        if let url = URL(string: app.artworkUrl512) {
            self.appIconImageView.kf.setImage(with: url)
        }
        self.appTitleLabel.text = app.trackName
        self.appDescripLabel.text = app.sellerName
    }
}
