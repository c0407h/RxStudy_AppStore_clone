//
//  Generator.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/20.
//

import Foundation
import Alamofire

final class Generator {
    
    func reviewCount(with reviewCnt: Int) -> String {
        
        let reviewCount: ((Int) -> (String)) = { (unit) in
            return String(format: "%.1f", Double(reviewCnt)/Double(unit))
        }
        
        switch reviewCnt {
        case 0...999: return "\(self)"
        case 1000...9999: return reviewCount(1000) + "천"
        case 10000...99999999: return reviewCount(10000) + "만"
        default: return "0"
        }
    }
    
    
    func byteSize(with fileSizeBytes: String) -> String {
        if let bytes = Float(fileSizeBytes) {
            return "\(round(bytes / 1024.0 / 1024.0 * 10) / 10)MB"
        } else {
            return "\(fileSizeBytes)Byte"
        }
    }
    
    func languageCnt(with languageCodes: [String]) -> String {
        if languageCodes.count == 1 {
            return "한국어"
        }
        return "한국어 외 \(languageCodes.count - 1)개"
    }
    
    
    func matchingMySearchText(searchText: String, mySearchingTexts: [String]) -> [String] {
        var matchingTxts: [String] = []
        matchingTxts = mySearchingTexts.filter({ $0.localizedStandardContains(searchText) })
        
        return matchingTxts
    }
    
    
    func fetchApps(searchText: String, completion: @escaping(([App]?, Error?) -> Void )) -> Bool {
        let urlString = "https://itunes.apple.com/search"
        guard let url = URL(string: urlString) else {
            //test
            return false
//            completion(nil, NSError(domain: "AppStore", code: 404, userInfo: nil))
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
        //test
        return true
    }
}
