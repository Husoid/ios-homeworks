//
//  ProfileViewController.swift
//  Navigation
//
//  Created by User on 10/04/2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var post = Post.makePost()
    
    private lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .lightGray
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        return tableView
    }()
    
    override func viewWillAppear(_ animated:Bool) {
       super.viewWillAppear(animated)
       tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    private func layout() {
        
        [tableView] .forEach {view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - UITableViewDataSource

extension ProfileViewController:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return post.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.delegate = self
            cell.tag = indexPath.row
            cell.addToCell(post: post[indexPath.row])
            return cell
            }
    }
}

//MARK: - UITableViewDelegate

extension ProfileViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return ProfileHeaderView()
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 222 : 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countViews = post[indexPath.row].views
        post[indexPath.row].views = countViews + 1
        let detailVC =  DetailPostViewController()
        detailVC.addToDetailPostVC(post: post[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        var deleteButton: UITableViewRowAction = {
            
            let deleteButton = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
                self.post.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .fade)
            }
            deleteButton.backgroundColor = .systemGray
            deleteButton.title = "Удалить"
            return deleteButton
        }()
        
        return [deleteButton]
    }
}

//MARK: - PhotosTableViewCellDelegate

extension ProfileViewController: PhotosTableViewCellDelegate {
    func buttonPressed() {
        let detailVC = PhotosViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

//MARK: - CustomPostTableleCellDelegate

extension ProfileViewController: CustomPostTableleCellDelegate {
    func clickDelegate(like: UILabel, cell: PostTableViewCell) {
        let str = like.text
        let countLike = String(str!.dropFirst(7))
        like.text = "Likes: \((Int(countLike) ?? 0) + 1)"
        post[cell.tag].likes += 1
    }
    
//    func clickDelegate(like: UILabel) {
//        let str = like.text
//        let countLike = String(str!.dropFirst(7))
//        like.text = "Likes: \((Int(countLike) ?? 0) + 1)"
//    }
    
}
