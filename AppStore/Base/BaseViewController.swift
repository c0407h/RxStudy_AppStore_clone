//
//  BaseViewController.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/20.
//

import UIKit

class BaseViewController: UIViewController {
    
    deinit {
        print("[===== deinit            =====] [[\(String(describing: type(of: self)))]]")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("[===== viewDidLoad            =====] [[\(String(describing: type(of: self)))]]")
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("[===== viewWillAppear            =====] [[\(String(describing: type(of: self)))]]")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("[===== viewDidAppear            =====] [[\(String(describing: type(of: self)))]]")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("[===== viewWillDisappear            =====] [[\(String(describing: type(of: self)))]]")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("[===== viewDidDisappear            =====] [[\(String(describing: type(of: self)))]]")
    }

    
}
