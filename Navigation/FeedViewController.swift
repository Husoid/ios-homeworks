//
//  FeedViewController.swift
//  Navigation
//
//  Created by User on 10/04/2022.
//

import UIKit

class FeedViewController: UIViewController {

    struct Post {
        var title:String
    }
    
    let post:Post = Post(title: "Пост")
    
    private let stackView:UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .green
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var buttonOne:UIButton = {
        let button = UIButton()
        button.center = view.center
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Открыть пост", for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(clik), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonTwo:UIButton = {
        let button = UIButton()
        button.center = view.center
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Открыть пост", for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(clik), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackView)

        [buttonOne, buttonTwo].forEach { stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 110),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    
    }
    
    @objc private func clik() {
        let postVC = PostViewController()
        postVC.title = post.title
        navigationController?.pushViewController(postVC, animated: true)
        
    }

}
