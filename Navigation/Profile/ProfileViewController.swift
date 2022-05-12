//
//  ProfileViewController.swift
//  Navigation
//
//  Created by User on 10/04/2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var profileHeadrVC:ProfileHeaderView = {
        let profileHeadrVC = ProfileHeaderView()
        profileHeadrVC.translatesAutoresizingMaskIntoConstraints = false
        profileHeadrVC.backgroundColor = .lightGray
        view.addSubview(profileHeadrVC)
        return profileHeadrVC
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    private func layout() {
        
        [profileHeadrVC, tableView] .forEach {view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            profileHeadrVC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeadrVC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeadrVC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeadrVC.heightAnchor.constraint(equalToConstant: 220),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: profileHeadrVC.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
    
}

//MARK: - UITableViewDataSource

extension ProfileViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
        
}

//MARK: - UITableViewDelegate

extension ProfileViewController:UITableViewDelegate {
    
}
