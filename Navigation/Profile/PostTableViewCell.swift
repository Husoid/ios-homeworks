//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by User on 12/05/2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private lazy var cellView:UIView = {
        let cellView = UIView()
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = .white
        return cellView
    }()
    
    private lazy var authorTextView:UITextView = {
        let authorTextView = UITextView()
        authorTextView.translatesAutoresizingMaskIntoConstraints = false
        authorTextView.backgroundColor = .white
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
       
        contentView.addSubview(cellView)
        
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        [authorTextView, descriptionTextView, image, likesTextView, viewsTextView] .forEach {cellView.addSubview($0)}

        NSLayoutConstraint.activate([
            authorTextView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            authorTextView.topAnchor.constraint(equalTo: cellView.topAnchor),
            authorTextView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            authorTextView.heightAnchor.constraint(equalToConstant: 50),

            image.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            image.topAnchor.constraint(equalTo: authorTextView.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: 300),

            descriptionTextView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            descriptionTextView.topAnchor.constraint(equalTo: image.bottomAnchor),
            descriptionTextView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 100),

            likesTextView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            likesTextView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor),
            likesTextView.widthAnchor.constraint(equalToConstant: 50),
            likesTextView.heightAnchor.constraint(equalToConstant: 50),

            viewsTextView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor),
            viewsTextView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor),
            viewsTextView.widthAnchor.constraint(equalToConstant: 50),
            viewsTextView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    
}
