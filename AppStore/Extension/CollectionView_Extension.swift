//
//  CollectionView.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/16.
//

import Foundation
import UIKit

extension UICollectionView {
    func register(name: String) {
        self.register(UINib(nibName: name, bundle: nil), forCellWithReuseIdentifier: name)
    }
    
    func registCells(names: String ...) {
        names.forEach { cellName in
            self.register(name: cellName)
        }
    }
    
    func loadCell<T>(indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T
    }
}
