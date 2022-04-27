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
        
        let navControllerFeed = UINavigationController(rootViewController: feedVC)
        let navControllerProfile = UINavigationController(rootViewController: profileVC)
        
        feedVC.tabBarItem.title = "Лента"
        feedVC.navigationItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "bolt")
        
        profileVC.tabBarItem.title = "Профиль"
        profileVC.navigationItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "bolt")
        
        viewControllers = [navControllerFeed, navControllerProfile]
    }
    
}
