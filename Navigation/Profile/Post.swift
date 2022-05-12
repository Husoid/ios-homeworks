//
//  Post.swift
//  Navigation
//
//  Created by User on 12/05/2022.
//

import UIKit

struct Post {
    let author: String
    let description: String
    let image: UIImage
    let likes: Int
    let views: Int
    
    static func makePost() -> [Post] {
        var post = [Post]()
        post.append(Post(author: "Руслан", description: "Банда Lacost", image: UIImage(named: "post_1")!, likes: 8, views: 5))
        post.append(Post(author: "Руслан", description: "Повышение квалификации", image: UIImage(named: "post_2")!, likes: 12, views: 8))
        post.append(Post(author: "Руслан", description: "Ученье свет", image: UIImage(named: "post_3")!, likes: 23, views: 9))
        post.append(Post(author: "Руслан", description: "Домашняя выпечка", image: UIImage(named: "post_4")!, likes: 34, views: 10))
        post.append(Post(author: "Руслан", description: "Парковка в не положенном месте", image: UIImage(named: "post_5")!, likes: 45, views: 12))
        post.append(Post(author: "Руслан", description: "Мясо на огне", image: UIImage(named: "post_6")!, likes: 68, views: 1))
        post.append(Post(author: "Руслан", description: "Катаемся на квадроциклах", image: UIImage(named: "post_7")!, likes: 50, views: 17))
        return post
    }
    
}
