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
        makeNewButton()
    }

    private func makeProfileHeadrVC () {
        let profileHeadrVC = ProfileHeaderView()
        profileHeadrVC.translatesAutoresizingMaskIntoConstraints = false
        profileHeadrVC.backgroundColor = .lightGray
        view.addSubview(profileHeadrVC)
        
        NSLayoutConstraint.activate([
            profileHeadrVC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeadrVC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeadrVC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeadrVC.heightAnchor.constraint(equalToConstant: 220)
            
        ])
        
    }
    
    private func makeNewButton () {
        let newButton = UIButton()
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.setTitle("Новая кнопка", for: .normal)
        view.addSubview(newButton)
        
        NSLayoutConstraint.activate([
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            newButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }

}
