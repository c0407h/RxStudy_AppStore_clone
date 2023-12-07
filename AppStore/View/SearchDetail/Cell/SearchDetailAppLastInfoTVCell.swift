//
//  SearchDetailAppLastInfoTVCell.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/19.
//

import UIKit

class SearchDetailAppLastInfoTVCell: BaseTableviewCell {

    @IBOutlet weak var sellerNameLabel: UILabel!
    @IBOutlet weak var dataSizeLabel: UILabel!
    @IBOutlet weak var categoryLable: UILabel!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var kindInfoView: UIView!
    @IBOutlet weak var kindInfoDesLabel: UILabel!
    
    
    
    
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    
    
    
    @IBOutlet weak var purchaseLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(appData: App) {
        self.sellerNameLabel.text = appData.sellerName
        self.dataSizeLabel.text = appData.fileSize
        self.categoryLable.text = appData.genres[0]
        self.kindLabel.text = "이 iPhone에서 사용가능"
        if let minVer = appData.minimumOsVersion {
            self.kindInfoDesLabel.text = "iPhone\niOS \(minVer) 이상 필요."
        }
        self.languageLabel.text = appData.languageTitle
        self.ageLabel.text = appData.contentAdvisoryRating
        self.purchaseLabel.text = "사용 가능"
        
        
        self.copyrightLabel.text = "© \(appData.sellerName)"
    }
    
    @IBAction func touchKindMore(_ sender: Any) {
        self.kindInfoView.isHidden = false
        self.layoutIfNeeded()
        self.parentTableView?.beginUpdates()
        self.parentTableView?.endUpdates()
    }
}
