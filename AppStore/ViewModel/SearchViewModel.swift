//
//  SearchViewModel.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/19.
// "https://itunes.apple.com/search?country=kr&media=software&term=\(searchText)"

import Foundation
import UIKit
import RxSwift
import RxCocoa

enum SearchCellType {
    case title(String)
    case separate(Int)
    case recentTitle(String)
    case matichTitle(String)
    case result(App)
}


final class SearchViewModel {
    private let searchService = SearchService()

    let apps = BehaviorRelay<[App]>(value: [])
    var appsObserver: Observable<[App]> {
        return apps.asObservable()
    }
    var isFiltering: Bool = false
    var cellType: [SearchCellType] {
        var cellType: [SearchCellType] = []
        
        if isSearching {
            for app in apps.value {
                cellType.append(.result(app))
            }
        } else {
            if self.isFiltering {
                for title in searchMatchingArr {
                    cellType.append(.separate(1))
                    cellType.append(.matichTitle(title))
                }
            } else {
                cellType.append(.title("최근 검색어"))
                for title in mySearchText {
                    cellType.append(.separate(1))
                    cellType.append(.recentTitle(title))
                }
            }
        }
        return cellType
    }
    
    
    var isSearching: Bool = false
    var mySearchText: [String] = UserDefaults.standard.object(forKey: "MySearchText") as? [String] ?? []
    var searchMatchingArr: [String] = []
    
    
    func fetchApps(searchText: String) -> Observable<[App]> {
        searchService.fetchApps(searchText: searchText)
    }
    
    func searchApps(searchText: String, onCompleted: @escaping() -> Void) {
        self.isSearching = true
        
        if let firstIndex = self.mySearchText.firstIndex(of: searchText) {
            self.mySearchText.remove(at: firstIndex)
        }
        self.mySearchText.insert(searchText, at: 0)
        
        UserDefaults.standard.set(mySearchText, forKey: "MySearchText")
        onCompleted()
        
    }
}

