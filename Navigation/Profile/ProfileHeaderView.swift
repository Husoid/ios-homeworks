//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by User on 25/04/2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var widthAvatarView = NSLayoutConstraint()
    private var heigthAvatarView = NSLayoutConstraint()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.image = UIImage(named: "изображение_viber_2020-11-07_12-39-49")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.isUserInteractionEnabled = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var text: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Хусаинов Руслан"
        text.textColor = .black
        text.backgroundColor = .lightGray
        text.font = UIFont.boldSystemFont(ofSize: 18)
        return text
    }()
    
    private lazy var textStatus: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Waiting for something..."
        text.textColor = .gray
        text.backgroundColor = .lightGray
        text.font = UIFont.systemFont(ofSize: 14)
        return text
    }()
    
    private lazy var textFieldStatus: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.backgroundColor = .white
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.borderWidth = 1
        text.layer.cornerRadius = 12
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.textColor = .black
        text.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        return text
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
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
    }()
    
    private lazy var statusText:String = ""
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
//        isUserInteractionEnabled = true
        [text, textStatus, textFieldStatus, button, imageView] .forEach {addSubview($0)}
        
        setupGestures()
        
        heigthAvatarView = imageView.heightAnchor.constraint(equalToConstant: 100)
        widthAvatarView = imageView.widthAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            widthAvatarView,
            heigthAvatarView,

            text.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            text.topAnchor.constraint(equalTo: imageView.topAnchor),
            text.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            text.heightAnchor.constraint(equalToConstant: 30),

            textStatus.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            textStatus.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -32),
            textStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textStatus.heightAnchor.constraint(equalToConstant: 30),

            textFieldStatus.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            textFieldStatus.topAnchor.constraint(equalTo: textStatus.bottomAnchor, constant: 16),
            textFieldStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textFieldStatus.heightAnchor.constraint(equalToConstant: 40),
            
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.topAnchor.constraint(equalTo: textFieldStatus.bottomAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonPressed() {
        textStatus.text = statusText
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
//        print("tydyhdfshdfhhdfhdfh")
        imageView.layer.cornerRadius = 20
        let blackView = UIView()
        blackView.backgroundColor = .black
        blackView.alpha = 0.1
        addSubview(blackView)
        blackView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//        let rotateAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
//        rotateAnimation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
//        rotateAnimation.fromValue = 0
//        rotateAnimation.toValue = 1.75 * Float.pi
//
//        let positionAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
//        positionAnimation.fromValue = redView.center
//        positionAnimation.toValue = CGPoint(x: view.bounds.width - 100, y: redView.center.y)
//
//        let groupAnimation = CAAnimationGroup()
//        groupAnimation.duration = 2.0
//        groupAnimation.animations = [rotateAnimation, positionAnimation]
//        groupAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
//        redView.layer.add(groupAnimation, forKey: nil)
//        redView.transform = CGAffineTransform(rotationAngle: CGFloat(1.75 * Float.pi))
//        redView.layer.position = CGPoint(x: view.bounds.width - 100, y: redView.center.y)
    }
}
