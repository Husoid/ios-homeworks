//
//  Photo.swift
//  Navigation
//
//  Created by User on 17/05/2022.
//

import UIKit

struct Photo {
    let image: UIImage
    
    static func makePhoto() -> [Photo] {
        var photo = [Photo]()
        photo.append(Photo(image: UIImage(named: "photo_1")!))
        photo.append(Photo(image: UIImage(named: "photo_2")!))
        photo.append(Photo(image: UIImage(named: "photo_3")!))
        photo.append(Photo(image: UIImage(named: "photo_4")!))
        photo.append(Photo(image: UIImage(named: "photo_5")!))
        photo.append(Photo(image: UIImage(named: "photo_6")!))
        photo.append(Photo(image: UIImage(named: "photo_7")!))
        photo.append(Photo(image: UIImage(named: "photo_8")!))
        photo.append(Photo(image: UIImage(named: "photo_9")!))
        photo.append(Photo(image: UIImage(named: "photo_10")!))
        photo.append(Photo(image: UIImage(named: "photo_11")!))
        photo.append(Photo(image: UIImage(named: "photo_12")!))
        photo.append(Photo(image: UIImage(named: "photo_13")!))
        photo.append(Photo(image: UIImage(named: "photo_14")!))
        photo.append(Photo(image: UIImage(named: "photo_15")!))
        photo.append(Photo(image: UIImage(named: "photo_16")!))
        photo.append(Photo(image: UIImage(named: "photo_17")!))
        photo.append(Photo(image: UIImage(named: "photo_18")!))
        photo.append(Photo(image: UIImage(named: "photo_19")!))
        photo.append(Photo(image: UIImage(named: "photo_20")!))
        return photo
    }
}
