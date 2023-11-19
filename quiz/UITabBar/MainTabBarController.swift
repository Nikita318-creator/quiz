//
//  MainTabBarController.swift
//  quiz
//
//  Created by никита уваров on 19.11.23.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabbar()
    }
    
    private func setTabbar() {
        if #available(iOS 13.0, *) {
            viewControllers = [
                getVC(vc: ViewController(), title: "menu", image: UIImage(systemName: "house")),
                getVC(vc: OptionViewController(), title: "settings", image: UIImage(systemName: "gearshape.fill"))
            ]
        }
    }
    
    private func getVC(vc: UIViewController, title: String, image: UIImage?) -> UIViewController {
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        return vc
    }
}
