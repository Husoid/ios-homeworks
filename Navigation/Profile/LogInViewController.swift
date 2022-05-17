//
//  LogInViewController.swift
//  Navigation
//
//  Created by User on 11/05/2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private var nc = NotificationCenter.default
    
    private lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView:UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var imageVC:UIImageView = {
        let imageVC = UIImageView()
        imageVC.translatesAutoresizingMaskIntoConstraints = false
        imageVC.image = UIImage(named: "logo")
        return imageVC
    }()
    
    private lazy var loginPasswordView:UIView = {
        let loginPasswordView = UIView()
        loginPasswordView.translatesAutoresizingMaskIntoConstraints = false
        loginPasswordView.layer.cornerRadius = 10
        loginPasswordView.layer.borderColor = UIColor.lightGray.cgColor
        loginPasswordView.layer.borderWidth = 0.5
        loginPasswordView.clipsToBounds = true
        return loginPasswordView
    }()
    
    private lazy var loginTextField:UITextField = {
        let loginTextField = UITextField()
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.backgroundColor = .systemGray6
        loginTextField.textColor = .black
        loginTextField.font = UIFont.systemFont(ofSize: 16)
        loginTextField.autocapitalizationType = .none
        loginTextField.layer.borderWidth = 0.5
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.clearsOnBeginEditing = true
        loginTextField.delegate = self
        loginTextField.placeholder = "Введите ваш логин"
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextField.frame.height))
        loginTextField.leftViewMode = .always
        return loginTextField
    }()
    
    private lazy var passwordTextField:UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.autocapitalizationType = .none
        passwordTextField.clearsOnBeginEditing = true
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.placeholder = "Введите ваш пароль"
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        return passwordTextField
    }()
    
    private lazy var button:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.clipsToBounds = true
        button.setTitle("Войти", for: .normal)
        button.addTarget(self, action: #selector(goToProfileHederView), for: .touchUpInside)
        return button
    }()
    
    @objc private func goToProfileHederView() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addElementToLoginViewController()
        addElementToLoginPasswordView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nc.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }
    
    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func addElementToLoginViewController() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [imageVC, loginPasswordView, button] .forEach {contentView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageVC.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageVC.widthAnchor.constraint(equalToConstant: 100),
            imageVC.heightAnchor.constraint(equalToConstant: 100),
            imageVC.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            
            loginPasswordView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginPasswordView.topAnchor.constraint(equalTo: imageVC.bottomAnchor, constant: 120),
            loginPasswordView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginPasswordView.heightAnchor.constraint(equalToConstant: 100),
            
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            button.topAnchor.constraint(equalTo: loginPasswordView.bottomAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func addElementToLoginPasswordView() {
        
        [loginTextField, passwordTextField] .forEach {loginPasswordView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            
            loginTextField.leadingAnchor.constraint(equalTo: loginPasswordView.leadingAnchor),
            loginTextField.topAnchor.constraint(equalTo: loginPasswordView.topAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: loginPasswordView.trailingAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.leadingAnchor.constraint(equalTo: loginPasswordView.leadingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: loginPasswordView.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
