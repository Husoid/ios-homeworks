//
//  FeedViewController.swift
//  Navigation
//
//  Created by User on 10/04/2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        makeButton()
        // Do any additional setup after loading the view.
    }
    
    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 150, height: 50))
        button.center = view.center
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Открыть пост", for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(clik), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    @objc private func clik() {
        let postVC = PostViewController()
        present(postVC, animated: true)
        
    }

}
