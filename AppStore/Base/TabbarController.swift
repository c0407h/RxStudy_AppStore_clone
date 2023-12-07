//
//  TabbarController.swift
//  AppStore
//
//  Created by Chung Wussup on 2023/09/16.
//


import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tabItemSetting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func tabItemSetting() {
        let vc1 = UINavigationController(rootViewController: TodayView())
        let vc2 = UINavigationController(rootViewController: GameView())
        let vc3 = UINavigationController(rootViewController: AppView())
        let vc4 = UINavigationController(rootViewController: ArcadeView())
        let vc5 = UINavigationController(rootViewController: SearchView())
        
        
        vc1.title = "투데이"
        vc1.tabBarItem.image = UIImage(systemName: "doc.text.image")
        
        vc2.title = "게임"
        vc2.tabBarItem.image = UIImage(systemName: "gamecontroller.fill")
        
        vc3.title = "앱"
        vc3.tabBarItem.image = UIImage(systemName: "square.stack.3d.up.fill")
        
        vc4.title = "아케이드"
        vc4.tabBarItem.image = UIImage(systemName: "dpad.fill")
        
        vc5.title = "검색"
        vc5.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        viewControllers = [vc1, vc2, vc3, vc4, vc5]
    }
}
