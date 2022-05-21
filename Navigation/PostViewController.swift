//
//  PostViewController.swift
//  Navigation
//
//  Created by User on 10/04/2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        makeBarItem()
    }
    
    private func makeBarItem() {
        let barItem = UIBarButtonItem(title: "Дальше", style: .plain, target: self, action: #selector(tabAction))
        navigationItem.rightBarButtonItem = barItem
    }

    @objc private func tabAction() {
        let infoVC = InfoViewController()
        infoVC.title = "Инфо"
        navigationController?.pushViewController(infoVC, animated: true)
    }
}
