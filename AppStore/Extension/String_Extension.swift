//
//  String_Extension.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/19.
//

import Foundation
extension String{
    func toDate(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
    
}
