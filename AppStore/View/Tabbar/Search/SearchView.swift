//
//  SearchView.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/16.
//

import UIKit
import RxSwift
import RxRelay

class SearchView: BaseViewController {
    let disposeBag = DisposeBag()
    
    let viewModel = SearchViewModel()
    
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        registCell()
        searchBarSetting()
        subscribe()
    }
    
    func registCell() {
        self.tableView.registerCells(names: "SeparateTVCell",
                                     "SearchTxtMatchingTVCell",
                                     "SearchTitleTVCell",
                                     "SearchAppTVCell",
                                     "RecentSearchContentsTVCell")
    }
    
    func searchBarSetting(){
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
    
        
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.title = "검색"
        
        searchController.searchBar.placeholder = "게임, 앱, 스토리 등"
        searchController.searchBar.setValue("취소", forKey: "cancelButtonText")
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
        self.navigationItem.searchController = searchController
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.searchController.searchBar.resignFirstResponder()
    }
    
   
    func fetchApps(searchText: String) {
        self.viewModel.fetchApps(searchText: searchText)
            .subscribe (onNext: { apps in
                self.viewModel.apps.accept(apps)
            })
            .disposed(by: disposeBag)
    }
    
    func subscribe() {
        self.viewModel.searchMatchingArr.removeAll()
        self.viewModel.appsObserver.subscribe(onNext: { apps in
            for app in apps {
                self.viewModel.searchMatchingArr.append(app.trackName)
            }
            self.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
}

extension SearchView: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        self.viewModel.isSearching = false
        self.viewModel.isFiltering = self.isFiltering
        
        self.viewModel.searchMatchingArr = self.viewModel.mySearchText.filter({ $0.localizedStandardContains(text)})
        dump(self.viewModel.searchMatchingArr)
        self.tableView.reloadData()
    }
    
}

extension SearchView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        
        viewModel.searchApps(searchText: searchText) {
            self.fetchApps(searchText: searchText)
            self.tableView.reloadData()
        }
        self.subscribe()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.viewModel.isSearching = false
    }
    
}

extension SearchView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cellType.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.viewModel.cellType[indexPath.row] {
        case .title(let title):
            if let cell: SearchTitleTVCell = tableView.loadCell(indexPath: indexPath) {
                cell.settingCell(title: title)
                return cell
            }
        case .recentTitle(let searchTxt):
            if let cell: RecentSearchContentsTVCell = tableView.loadCell(indexPath: indexPath) {
                cell.settingCell(searchTxt: searchTxt)
                return cell
            }
        case .separate(let height):
            if let cell: SeparateTVCell = tableView.loadCell(indexPath: indexPath) {
                cell.settingCell(height: height)
                return cell
            }
        case .matichTitle(let title):
            if let cell: SearchTxtMatchingTVCell = tableView.loadCell(indexPath: indexPath) {
                cell.settingCell(searchTxt: title)
                return cell
            }
        case .result(let app) :
            if let cell: SearchAppTVCell = tableView.loadCell(indexPath: indexPath) {
                cell.setData(app: app)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.searchController.searchBar.resignFirstResponder()
        switch self.viewModel.cellType[indexPath.row] {
        case .recentTitle(let searchText), .matichTitle(let searchText):
            self.viewModel.isSearching = true
            
            self.searchController.isActive = true
            self.searchController.searchBar.text = searchText
            viewModel.searchApps(searchText: searchText) {
                self.tableView.reloadData()
            }
            
            self.fetchApps(searchText: searchText)
        case .result(let app):
            let detailView = SearchDetailView(nibName: "SearchDetailView", bundle: nil)
            detailView.app = app
            self.navigationController?.pushViewController(detailView, animated: true)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}


