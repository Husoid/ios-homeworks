//
//  LogInViewController.swift
//  Navigation
//
//  Created by User on 11/05/2022.
//

import UIKit

class LogInViewController: UIViewController {
    
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
        loginPasswordView.layer.borderWidth = 2
        loginPasswordView.clipsToBounds = true
        return loginPasswordView
    }()
    
    private lazy var loginTextField:UITextField = {
        let loginTextField = UITextField()
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.backgroundColor = .systemGray6
        loginTextField.layer.borderWidth = 2
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.clearsOnBeginEditing = true
        loginTextField.text = "Введите ваш логин"
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextField.frame.height))
        loginTextField.leftViewMode = .always
        return loginTextField
    }()
    
    private lazy var passwordTextField:UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.clearsOnBeginEditing = true
        passwordTextField.addTarget(self, action: #selector(onTextSecure), for: .touchDown)
        passwordTextField.text = "Введите ваш пароль"
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        return passwordTextField
    }()
    
    private lazy var button:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "ColorVC")
        button.setTitle("Войти", for: .normal)
        button.addTarget(self, action: #selector(goToProfileHederView), for: .touchUpInside)
        return button
    }()
    
    @objc private func onTextSecure() {
        passwordTextField.isSecureTextEntry = true
    }
    
    @objc private func goToProfileHederView() {
        let profileVC = ProfileViewController()
//        profileVC.title = "Профиль"
//        profileVC.navigationController?.navigationBar.isHidden = false
        navigationController?.pushViewController(profileVC, animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addElementToLoginViewController()
        addElementToLoginPasswordView()

    }
    
    private func addElementToLoginViewController() {
        
        [imageVC, loginPasswordView, button] .forEach {view.addSubview($0)}
        
        NSLayoutConstraint.activate([
            
            imageVC.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageVC.widthAnchor.constraint(equalToConstant: 100),
            imageVC.heightAnchor.constraint(equalToConstant: 100),
            imageVC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            loginPasswordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginPasswordView.topAnchor.constraint(equalTo: imageVC.bottomAnchor, constant: 100),
            loginPasswordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginPasswordView.heightAnchor.constraint(equalToConstant: 100),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.topAnchor.constraint(equalTo: loginPasswordView.bottomAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 50)
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
