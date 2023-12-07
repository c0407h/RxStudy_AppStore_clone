//
//  INT_Extension.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/19.
//

import Foundation

extension Int {
    func reviewCount() -> String {
        let reviewCount: ((Int) -> (String)) = { (unit) in
            return String(format: "%.1f", Double(self)/Double(unit))
        }

        switch self {
        case 0...999: return "\(self)"
        case 1000...9999: return reviewCount(1000) + "천"
        case 10000...99999999: return reviewCount(10000) + "만"
        default: return "0"
        }
    }
}
