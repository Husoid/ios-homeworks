//
//  TabBarViewController.swift
//  Navigation
//
//  Created by User on 10/04/2022.
//

import UIKit

class TabBarViewController: UITabBarController {

    let feedVC = FeedViewController()
    let loginVC = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
    }
    
    private func setupTabBarController() {
        
        let navControllerFeed = UINavigationController(rootViewController: feedVC)
        let navControllerProfile = UINavigationController(rootViewController: loginVC)
        
        feedVC.tabBarItem.title = "Лента"
        feedVC.navigationItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "bolt")
        
        loginVC.tabBarItem.title = "Профиль"
        loginVC.navigationController?.navigationBar.isHidden = true
        loginVC.tabBarItem.image = UIImage(systemName: "bolt")
        
        viewControllers = [navControllerFeed, navControllerProfile]
    }
}
