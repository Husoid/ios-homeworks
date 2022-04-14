//
//  TabBarViewController.swift
//  Navigation
//
//  Created by User on 10/04/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    let feedVC = FeedViewController()
    let profileVC = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()

    }
    
    private func setupTabBarController() {
        feedVC.tabBarItem.title = "Лента"
        profileVC.tabBarItem.title = "Профиль"
        
        viewControllers = [feedVC, profileVC]
        
//        feedVC.tabBarItem.image =
    }
    
    
    

}
