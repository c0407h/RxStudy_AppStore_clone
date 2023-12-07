//
//  BaseNaviViewController.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/16.
//

import Foundation
import UIKit

class NaviManager {
    static let shared: NaviManager = NaviManager()
    
    //뒤로가기 안시킬 VC
    var disabledPopVCs: [UIViewController.Type] = [
    ]
    
    func addDisableVC(vcType: UIViewController.Type) {
        self.disabledPopVCs.append(vcType)
    }
}

class BaseNaviViewController: UINavigationController {
    
    private var duringTransition = false
    
    private var disabledPopVCs: [UIViewController.Type] {
        return NaviManager.shared.disabledPopVCs
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactivePopGestureRecognizer?.delegate = self
        self.delegate = self
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        duringTransition = true
        
        super.pushViewController(viewController, animated: animated)
    }
    
}

extension BaseNaviViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        self.duringTransition = false
    }
}

extension BaseNaviViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer == interactivePopGestureRecognizer,
              let topVC = topViewController else {
            return true // default value
        }
        
        return viewControllers.count > 1 && duringTransition == false && isPopGestureEnable(topVC)
    }
    
    private func isPopGestureEnable(_ topVC: UIViewController) -> Bool {
        for vc in disabledPopVCs {
            if String(describing: type(of: topVC)) == String(describing: vc) {
                return false
            }
        }
        return true
    }
}
