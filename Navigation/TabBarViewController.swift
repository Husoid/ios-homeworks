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
        let navController = UINavigationController(rootViewController: feedVC)
        navController.tabBarItem.title = "Лента"
        feedVC.navigationItem.title = "jkbjk"
        
        profileVC.tabBarItem.title = "Профиль"
        
        viewControllers = [profileVC, navController]
    }
    
    
    

}
