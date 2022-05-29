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
    private var leadingAvatarView = NSLayoutConstraint()
    private var topAvatarView = NSLayoutConstraint()
    
    private lazy var viewFoAnimate: UIView = {
        let viewFoAnimate = UIView()
        viewFoAnimate.translatesAutoresizingMaskIntoConstraints = false
        viewFoAnimate.backgroundColor = .black
        viewFoAnimate.alpha = 0
        return viewFoAnimate
    }()
    
    private lazy var cancelShowAvatar: UIImageView = {
        let cancelShowAvatar = UIImageView()
        cancelShowAvatar.translatesAutoresizingMaskIntoConstraints = false
        cancelShowAvatar.image = UIImage(named: "cancel")
        cancelShowAvatar.clipsToBounds = true
        cancelShowAvatar.isUserInteractionEnabled = true
        cancelShowAvatar.alpha = 0
        return cancelShowAvatar
    }()
    
    private lazy var imageView: UIImageView = {
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
    
    private lazy var text: UILabel = {
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Хусаинов Руслан"
        text.textColor = .black
        text.backgroundColor = .lightGray
        text.font = UIFont.boldSystemFont(ofSize: 18)
        return text
    }()
    
    private lazy var textStatus: UILabel = {
        let text = UILabel()
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
        text.isUserInteractionEnabled = true 
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
        [text, textStatus, textFieldStatus, button, viewFoAnimate, imageView, cancelShowAvatar] .forEach {addSubview($0)}
        setupGestures()
        
        heigthAvatarView = imageView.heightAnchor.constraint(equalToConstant: 100)
        widthAvatarView = imageView.widthAnchor.constraint(equalToConstant: 100)
        leadingAvatarView = imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        topAvatarView = imageView.topAnchor.constraint(equalTo: topAnchor, constant: 16)
        
        NSLayoutConstraint.activate([
            leadingAvatarView,
            topAvatarView,
            widthAvatarView,
            heigthAvatarView,

            viewFoAnimate.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewFoAnimate.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            viewFoAnimate.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewFoAnimate.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            cancelShowAvatar.topAnchor.constraint(equalTo: viewFoAnimate.topAnchor, constant: 20),
            cancelShowAvatar.trailingAnchor.constraint(equalTo: viewFoAnimate.trailingAnchor, constant: -20),
            cancelShowAvatar.heightAnchor.constraint(equalToConstant: 30),
            cancelShowAvatar.widthAnchor.constraint(equalToConstant: 30),
            
            text.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 132),
            text.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            text.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            text.heightAnchor.constraint(equalToConstant: 30),

            textStatus.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 132),
            textStatus.bottomAnchor.constraint(equalTo: topAnchor, constant: 94),
            textStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textStatus.heightAnchor.constraint(equalToConstant: 30),

            textFieldStatus.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 132),
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
        if textFieldStatus.text != "" {
            textStatus.text = statusText
        } else {
            vibration(viewForAnimate: textFieldStatus)
        }
    }
    
    private func vibration(viewForAnimate: UIView) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: viewForAnimate.center.x - 10, y: viewForAnimate.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: viewForAnimate.center.x + 10, y: viewForAnimate.center.y))
        viewForAnimate.layer.add(animation, forKey: "position")
    }
    
    private func setupGestures() {
        let tapGestureShowAvatar = UITapGestureRecognizer(target: self, action: #selector(tapActionShow))
        imageView.addGestureRecognizer(tapGestureShowAvatar)
        
        let tapGestureHidenAvatar = UITapGestureRecognizer(target: self, action: #selector(tapActionHiden))
        cancelShowAvatar.addGestureRecognizer(tapGestureHidenAvatar)
    }
    
    @objc private func tapActionShow() {
        
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.7) {
                self.viewFoAnimate.alpha = 0.5
                self.heigthAvatarView.constant = UIScreen.main.bounds.height
                self.widthAvatarView.constant = UIScreen.main.bounds.width
                self.leadingAvatarView.constant = 0
                self.topAvatarView.constant = 0
                self.imageView.layer.cornerRadius = 0
                self.imageView.contentMode = .scaleAspectFit
                self.layoutIfNeeded()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 1) {
                self.cancelShowAvatar.alpha = 1
                self.layoutIfNeeded()
            }
        }
    }
    
    @objc private func tapActionHiden() {
        
        UIView.animateKeyframes(withDuration: 0.9, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                self.cancelShowAvatar.alpha = 0
                self.layoutIfNeeded()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.9) {
                self.viewFoAnimate.alpha = 0
                self.heigthAvatarView.constant = 100
                self.widthAvatarView.constant = 100
                self.leadingAvatarView.constant = 16
                self.topAvatarView.constant = 16
                self.imageView.layer.cornerRadius = 50
                self.layoutIfNeeded()
            }
        }
    }
}
