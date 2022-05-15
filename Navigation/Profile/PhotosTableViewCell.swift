//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by User on 15/05/2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var cellView:UIView = {
        let cellView = UIView()
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = .blue
        return cellView
    }()

    private lazy var photoLabel: UILabel = {
        let photoLabel = UILabel()
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        photoLabel.textColor = .black
        photoLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photoLabel.text = "Фото"
        photoLabel.backgroundColor = .red
        return photoLabel
    }()
    
    private lazy var nextImage: UIImageView = {
        let nextImage = UIImageView()
        nextImage.translatesAutoresizingMaskIntoConstraints = false
        nextImage.backgroundColor = .systemGray
        return nextImage
    }()
    
//    private lazy var photoCollection: UICollectionView = {
//        let photoCollection = UICollectionView()
//        photoCollection.translatesAutoresizingMaskIntoConstraints = false
//        return photoCollection
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
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
        
        [photoLabel, nextImage] .forEach {cellView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            photoLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 12),
            photoLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 12),
            photoLabel.widthAnchor.constraint(equalToConstant: 50),
            photoLabel.heightAnchor.constraint(equalToConstant: 60),
            
            nextImage.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            nextImage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -12),
            nextImage.widthAnchor.constraint(equalToConstant: 30),
            nextImage.heightAnchor.constraint(equalToConstant: 30),
            nextImage.bottomAnchor.constraint(equalTo: cellView.bottomAnchor)
            
//            photoCollection.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 12),
//            photoCollection.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
//            photoCollection.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -12),
//            photoCollection.heightAnchor.constraint(equalToConstant: 100),
//            photoCollection.bottomAnchor.constraint(equalTo: cellView.bottomAnchor)
        ])
    }

}
