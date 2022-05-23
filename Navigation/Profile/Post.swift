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
    var likes: Int
    var views: Int
    
    static func makePost() -> [Post] {
        var post = [Post]()
        post.append(Post(author: "Руслан. Тюмень - самый лучший город на земле.", description: "Банда Lacost. Lacoste (по-русски произносится: Лако́ст) — французская компания по производству одежды, обуви, парфюмерии, очков, часов и различных кожаных изделий. Основана в 1933 году, символом и логотипом является изображение зелёного крокодила.", image: UIImage(named: "post_1")!, likes: 8, views: 5))
        post.append(Post(author: "Руслан. Тюмень - самый лучший город на земле", description: "Повышение квалификации. Цель повышения квалификации — дать актуальные сведения о нововведениях и достижениях отрасли. Курсы должны привести практико-теоретические знания специалистов в соответствие с нормами профстандартов и ЕКСД (единого классификатора должностей).", image: UIImage(named: "post_2")!, likes: 12, views: 8))
        post.append(Post(author: "Руслан. Тюмень - самый лучший город на земле.", description: "Ученье свет", image: UIImage(named: "post_3")!, likes: 23, views: 9))
        post.append(Post(author: "Руслан. Тюмень - самый лучший город на земле.", description: "Домашняя выпечка", image: UIImage(named: "post_4")!, likes: 34, views: 10))
        post.append(Post(author: "Руслан. Тюмень - самый лучший город на земле.", description: "Парковка в не положенном месте", image: UIImage(named: "post_5")!, likes: 45, views: 12))
        post.append(Post(author: "Руслан. Тюмень - самый лучший город на земле.", description: "Мясо на огне", image: UIImage(named: "post_6")!, likes: 68, views: 1))
        post.append(Post(author: "Руслан. Тюмень - самый лучший город на земле.", description: "Катаемся на квадроциклах", image: UIImage(named: "post_7")!, likes: 50, views: 17))
        return post
    }
}
