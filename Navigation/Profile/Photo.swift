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
        photo.append(Photo(image: UIImage(named: "post_1")!))
        photo.append(Photo(image: UIImage(named: "post_2")!))
        photo.append(Photo(image: UIImage(named: "post_3")!))
        photo.append(Photo(image: UIImage(named: "post_4")!))
        photo.append(Photo(image: UIImage(named: "post_5")!))
        photo.append(Photo(image: UIImage(named: "post_6")!))
        photo.append(Photo(image: UIImage(named: "post_7")!))
        return photo
    }
    
}
