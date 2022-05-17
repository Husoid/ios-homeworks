//
//  InfoViewController.swift
//  Navigation
//
//  Created by User on 15/04/2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        makeButton()
    }
    
    private func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        button.center = view.center
        button.setTitle("выбор", for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func action() {
        let alert = UIAlertController(title: "Сообщение", message: "Дошел до конца домашней работы", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default) { _ in
            print("Сделал домашнюю работу")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in
            print("Не правильно сделал работу")
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}
