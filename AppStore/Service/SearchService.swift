//
//  SearchService.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/19.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

 
protocol SearchServiceProtocol {
    func fetchApps(searchText: String) -> Observable<[App]>
}

class SearchService: SearchServiceProtocol {
    
    func fetchApps(searchText: String) -> Observable<[App]> {
        return Observable.create { (observer) ->Disposable in
            self.fetchApps(searchText: searchText) { (apps, error) in
                if let error = error {
                    observer.onError(error)
                }
                
                if let apps = apps {
                    observer.onNext(apps)
                }
                
                observer.onCompleted()
            }

            return Disposables.create()
        }
    }
    
    private func fetchApps(searchText: String, completion: @escaping(([App]?, Error?) -> Void )) {
        let urlString = "https://itunes.apple.com/search"
        guard let url = URL(string: urlString) else {
            return completion(nil, NSError(domain: "AppStore", code: 404, userInfo: nil))
        }
        let param: Parameters = ["country":"kr","media":"software", "limit": 10, "term":searchText]
        
        AF.request(url, method: .get, parameters: param, encoding: URLEncoding.default, headers: nil).responseDecodable(of: AppStore.self) { response in
            if let error = response.error {
                return completion(nil, error)
            }
            
            if let apps = response.value?.results {
                return completion(apps, nil)
            }
        }
    }
}
