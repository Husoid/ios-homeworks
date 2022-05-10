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
        view.addSubview(profileHeadrVC)
        view.addSubview(newButton)
        
        NSLayoutConstraint.activate([
            profileHeadrVC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeadrVC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeadrVC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeadrVC.heightAnchor.constraint(equalToConstant: 220),
            
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            newButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    override func viewWillLayoutSubviews() {

    }

    private lazy var profileHeadrVC:ProfileHeaderView = {
        let profileHeadrVC = ProfileHeaderView()
        profileHeadrVC.translatesAutoresizingMaskIntoConstraints = false
        profileHeadrVC.backgroundColor = .lightGray
        view.addSubview(profileHeadrVC)
        return profileHeadrVC
    }()
    
    private lazy var newButton:UIButton = {
        let newButton = UIButton()
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.setTitle("Новая кнопка", for: .normal)
        newButton.backgroundColor = .blue
        view.addSubview(newButton)
        return newButton
    }()

}
