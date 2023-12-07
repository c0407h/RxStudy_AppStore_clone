//
//  SearchDetailView.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/16.
//

import UIKit

enum DetailCellType {
    case main(App)
    case info(App)
    case update(String, String, String)
    case screenShot([String])
    case detailInfo(String, String, String)
    case rating(Int, Double)
    case appInfo(App)
}


class SearchDetailView: UIViewController {
    var cellType: [DetailCellType]  {
        var cellType: [DetailCellType] = []
        guard let app = self.app else {
            return []
        }
        cellType.append(.main(app))
        cellType.append(.info(app))
        cellType.append(.update(app.releaseNotes, app.version, app.currentVersionReleaseDate))
        cellType.append(.screenShot(app.screenshotUrls))
        cellType.append(.detailInfo(app.description, app.sellerName, app.sellerUrl ?? ""))
        cellType.append(.rating(app.userRatingCount, app.averageUserRating))
        cellType.append(.appInfo(app))
        return cellType
    }
    
    var app: App?
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .plain, target: self, action: nil)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        registCell()
    }
    
    func registCell() {
        self.tableView.registerCells(names: "SearchDetailAppMainTVCell",
                                     "SearchDetailAppInfoTVCell",
                                     "SeachDetailAppDetailTVCell",
                                     "SearchDetailAppNewsTVCell",
                                     "SearchDetailAppRatingTVCell",
                                     "SearchDetailAppLastInfoTVCell",
                                     "SearchDetailAppScreenShotTVCell")
    }

}
extension SearchDetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.cellType[indexPath.row] {
        case .main(let app):
            if let cell: SearchDetailAppMainTVCell = tableView.loadCell(indexPath: indexPath) {
                cell.setData(app: app)
                return cell
            }
        case .info(let app):
            if let cell: SearchDetailAppInfoTVCell = tableView.loadCell(indexPath: indexPath) {
                cell.setData(app: app)
                return cell
            }
        case .screenShot(let app):
            if let cell: SearchDetailAppScreenShotTVCell = tableView.loadCell(indexPath: indexPath) {
                cell.setData(screenShot: app)
                return cell
            }
        case .detailInfo(let description, let seller, let url):
            if let cell: SeachDetailAppDetailTVCell = tableView.loadCell(indexPath: indexPath) {
                cell.setData(description: description, seller: seller, url: url)
                return cell
            }
        case .update(let updateInfo, let version, let date):
            if let cell: SearchDetailAppNewsTVCell = tableView.loadCell(indexPath: indexPath) {
                cell.setData(updateInfo: updateInfo, version: version, date: date)
                return cell
            }
        case .rating(let reviewCnt, let ratingNum):
            if let cell: SearchDetailAppRatingTVCell = tableView.loadCell(indexPath: indexPath) {
                cell.setData(reviewCnt: reviewCnt, ratingNum: ratingNum)
                return cell
            }
        case .appInfo(let app):
            if let cell: SearchDetailAppLastInfoTVCell = tableView.loadCell(indexPath: indexPath) {
                cell.setData(appData: app)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
}
