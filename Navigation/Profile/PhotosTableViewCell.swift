//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by User on 15/05/2022.
//

import UIKit

protocol PhotosTableViewCellDelegate: AnyObject {
    func buttonPressed()
}

class PhotosTableViewCell: UITableViewCell {
    
    weak var delegate: PhotosTableViewCellDelegate?
    
    private let photo = Photo.makePhoto()
    
    private lazy var cellView:UIView = {
        let cellView = UIView()
        cellView.translatesAutoresizingMaskIntoConstraints = false
        return cellView
    }()

    private lazy var photoLabel: UILabel = {
        let photoLabel = UILabel()
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        photoLabel.textColor = .black
        photoLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photoLabel.text = "Фото"
        photoLabel.layer.cornerRadius = 6
        photoLabel.clipsToBounds = true
        return photoLabel
    }()
    
    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setBackgroundImage(UIImage(named: "arrow"), for: .normal)
        nextButton.addTarget(self, action: #selector(detailVCDelegate), for: .touchUpInside)
        return nextButton
    }()
    
    private lazy var photoCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let photoCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photoCollection.translatesAutoresizingMaskIntoConstraints = false
        photoCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        photoCollection.dataSource = self
        photoCollection.delegate = self
        return photoCollection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func detailVCDelegate() {
        delegate?.buttonPressed()
    }
    
    private func layout() {
        
        contentView.addSubview(cellView)
        
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        [photoLabel, nextButton, photoCollection] .forEach {cellView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            photoLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 12),
            photoLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 12),
            photoLabel.widthAnchor.constraint(equalToConstant: 80),
            
            nextButton.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            nextButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -12),
            nextButton.widthAnchor.constraint(equalToConstant: 30),
            nextButton.heightAnchor.constraint(equalToConstant: 30),
            
            photoCollection.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 12),
            photoCollection.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            photoCollection.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -12),
            photoCollection.heightAnchor.constraint(equalToConstant: (contentView.bounds.width - 48) / 4),
            photoCollection.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -12)
        ])
    }
}

//MARK: - UICollectionViewDataSource

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell;()
        cell.addToCell(photo: photo[indexPath.row])
        cell.layer.cornerRadius = 6
        cell.backgroundColor = .white
        cell.clipsToBounds = true
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (cellView.bounds.width - 48) / 4
        return CGSize(width: width, height: width)
    }
}