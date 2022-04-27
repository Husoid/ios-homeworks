//
//  ProfileViewController.swift
//  Navigation
//
//  Created by User on 10/04/2022.
//

import UIKit

class ProfileViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    override func viewWillLayoutSubviews() {
        makeProfileHeadrVC()
    }

    private func makeProfileHeadrVC () {
        let profileHeadrVC = ProfileHeaderView()
        profileHeadrVC.frame = view.safeAreaLayoutGuide.layoutFrame
        profileHeadrVC.backgroundColor = .lightGray
        view.addSubview(profileHeadrVC)
        
    }

}
