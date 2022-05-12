//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by User on 12/05/2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private lazy var authorTextView:UITextView = {
        let authorTextView = UITextView()
        authorTextView.translatesAutoresizingMaskIntoConstraints = false
        authorTextView.backgroundColor = .lightGray
        return authorTextView
    }()
    
    private lazy var descriptionTextView:UITextView = {
        let descriptionTextView = UITextView()
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.backgroundColor = .systemGray2
        return descriptionTextView
    }()
    
    private lazy var image:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var likesTextView:UITextView = {
        let likesTextView = UITextView()
        likesTextView.translatesAutoresizingMaskIntoConstraints = false
        likesTextView.backgroundColor = .blue
        return likesTextView
    }()
    
    private lazy var viewsTextView:UITextView = {
        let viewsTextView = UITextView()
        viewsTextView.translatesAutoresizingMaskIntoConstraints = false
        viewsTextView.backgroundColor = .brown
        return viewsTextView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        
        [authorTextView, descriptionTextView, image, likesTextView, viewsTextView] .forEach {contentView.addSubview($0)}
        
        let x = contentView.frame.size.width / 2
        
        NSLayoutConstraint.activate([
            authorTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            authorTextView.topAnchor.constraint(equalTo: contentView.topAnchor),
            authorTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            authorTextView.heightAnchor.constraint(equalToConstant: 50),
            
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.topAnchor.constraint(equalTo: authorTextView.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: 500),
            
            descriptionTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionTextView.topAnchor.constraint(equalTo: image.bottomAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 100),
            
            likesTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            likesTextView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor),
            likesTextView.trailingAnchor.constraint(equalTo: viewsTextView.leadingAnchor),
            likesTextView.widthAnchor.constraint(equalToConstant: x),
            likesTextView.heightAnchor.constraint(equalToConstant: 100),
            
            viewsTextView.leadingAnchor.constraint(equalTo: likesTextView.trailingAnchor),
            viewsTextView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor),
            viewsTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewsTextView.widthAnchor.constraint(equalToConstant: x),
            viewsTextView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    
}
