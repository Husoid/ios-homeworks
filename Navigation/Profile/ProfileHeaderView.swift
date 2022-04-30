//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by User on 25/04/2022.
//

import UIKit

class ProfileHeaderView: UIView {

//    let widthSize = UIScreen.main.bounds.screens.size.width
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(text)
        addSubview(textStatus)
        addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 100, height: 100))
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image = UIImage(named: "изображение_viber_2020-11-07_12-39-49")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        return imageView
    } ()
    
    let text: UITextView = {
        let text = UITextView(frame: CGRect(x: 132, y: 27, width: 300, height: 20))
        text.text = "Хусаинов Руслан"
        text.textColor = .black
        text.font = UIFont.boldSystemFont(ofSize: 18)
        return text
    } ()
    
    let textStatus: UITextView = {
        let text = UITextView(frame: CGRect(x: 132, y: 80, width: 300, height: 20))
        text.text = "Waiting for something..."
        text.textColor = .gray
        text.font = UIFont.systemFont(ofSize: 14)
        return text
    } ()
    
//    let textStatus: UITextField = {
//        let text = UITextFild(frame: CGRect(x: 132, y: 80, width: 300, height: 20))
//        text.text = "Waiting for something..."
//        text.textColor = .gray
//        text.font = UIFont.systemFont(ofSize: 14)
//        return text
//    } ()
    
    let button:UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: 132, width: UIScreen.main.bounds.width - 32, height: 50))
        button.backgroundColor = .blue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    } ()
    
    @objc private func buttonPressed() {
        print(textStatus.text!)
    }
}
