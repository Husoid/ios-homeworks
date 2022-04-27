//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by User on 25/04/2022.
//

import UIKit

class ProfileHeaderView: UIView {

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 150, height: 150))
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image = UIImage(named: "изображение_viber_2020-11-07_12-39-49")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        return imageView
    } ()
    
    let text: UITextField = {
        let text = UITextField(frame: CGRect(x: 182, y: 27, width: 100, height: 50))
        text.text = "Хусаинов Руслан"
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 18)
        return text
    } ()
}
