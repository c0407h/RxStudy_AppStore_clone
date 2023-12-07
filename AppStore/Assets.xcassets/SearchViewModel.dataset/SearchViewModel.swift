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

final class SearchViewModel {
    private let searchService = SearchService()

    func fetchApps(searchText: String) -> Observable<[App]> {
        searchService.fetchApps(searchText: searchText)
    }
}
