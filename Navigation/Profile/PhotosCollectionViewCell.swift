//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by User on 16/05/2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        customCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customCell() {
        contentView.layer.cornerRadius = 6
    }
    
}
