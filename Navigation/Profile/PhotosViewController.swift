//
//  PhotosViewController.swift
//  Navigation
//
//  Created by User on 17/05/2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private let photo = Photo.makePhoto()
    
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
    
    private lazy var cancelShowPhoto: UIImageView = {
        let cancelShowPhoto = UIImageView()
        cancelShowPhoto.translatesAutoresizingMaskIntoConstraints = false
        cancelShowPhoto.image = UIImage(named: "cancel")
        cancelShowPhoto.clipsToBounds = true
        cancelShowPhoto.isUserInteractionEnabled = true
        cancelShowPhoto.alpha = 0
        return cancelShowPhoto
    }()
    
    private lazy var detailImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0
        return image
    }()

    private lazy var photoCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let photoCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photoCollection.translatesAutoresizingMaskIntoConstraints = false
        photoCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        photoCollection.dataSource = self
        photoCollection.delegate = self
        return photoCollection
    }()
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        layout()
//    }
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Фото галерея"
        navigationController?.navigationBar.isHidden = false
        layout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func layout() {

        [photoCollection, viewFoAnimate, detailImage, cancelShowPhoto] .forEach {view.addSubview($0)}
        
        setupGestures()
        
        heigthAvatarView = detailImage.heightAnchor.constraint(equalToConstant: 100)
        widthAvatarView = detailImage.widthAnchor.constraint(equalToConstant: 100)
        leadingAvatarView = detailImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        topAvatarView = detailImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        
        NSLayoutConstraint.activate([
            viewFoAnimate.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewFoAnimate.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viewFoAnimate.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewFoAnimate.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            photoCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            leadingAvatarView,
            topAvatarView,
            widthAvatarView,
            heigthAvatarView,
            
            cancelShowPhoto.topAnchor.constraint(equalTo: viewFoAnimate.topAnchor, constant: 20),
            cancelShowPhoto.trailingAnchor.constraint(equalTo: viewFoAnimate.trailingAnchor, constant: -20),
            cancelShowPhoto.heightAnchor.constraint(equalToConstant: 30),
            cancelShowPhoto.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    private func setupGestures() {
        let tapGestureHidenAvatar = UITapGestureRecognizer(target: self, action: #selector(tapActionHiden))
        cancelShowPhoto.addGestureRecognizer(tapGestureHidenAvatar)
    }
    
    @objc private func tapActionHiden() {
        
        navigationController?.navigationBar.isHidden = false
        view.setNeedsLayout()
        
        UIView.animateKeyframes(withDuration: 0.9, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                self.cancelShowPhoto.alpha = 0
                self.view.layoutIfNeeded()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.9) {
                self.viewFoAnimate.alpha = 0
//                self.heigthAvatarView.constant = 0
//                self.widthAvatarView.constant = 0
//                self.leadingAvatarView.constant = 0
//                self.topAvatarView.constant = 0
                self.detailImage.alpha = 0
                self.view.layoutIfNeeded()
            }
        }
    }
}

//MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell;()
        cell.addToCell(photo: photo[indexPath.row])
        cell.backgroundColor = .systemGray4
        cell.clipsToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        detailImage.image = photo[indexPath.row].image
        navigationController?.navigationBar.isHidden = true
        view.setNeedsLayout()
        
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.7) {
                self.viewFoAnimate.alpha = 0.5
                self.heigthAvatarView.constant = UIScreen.main.bounds.height
                self.widthAvatarView.constant = UIScreen.main.bounds.width
                self.leadingAvatarView.constant = 0
                self.topAvatarView.constant = -50
                self.detailImage.layer.cornerRadius = 0
                self.detailImage.alpha = 1
                self.detailImage.contentMode = .scaleAspectFit
                self.view.layoutIfNeeded()
            }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 1) {
                self.cancelShowPhoto.alpha = 1
                self.view.layoutIfNeeded()
            }
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.bounds.width - 40) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
        
}
