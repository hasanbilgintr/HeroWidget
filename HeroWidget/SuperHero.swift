//
//  SuperHero.swift
//  HeroWidget
//
//  Created by hasan bilgin on 22.10.2023.
//

import Foundation


struct SuperHero : Identifiable , Codable{
    let image : String
    let name : String
    let realName : String
    var id : String{image} // demek id image ne ise o olur
}

let superman = SuperHero(image: "superman", name: "Süperman", realName: "Clark Kent")
let batman = SuperHero(image: "batman", name: "Batman", realName: "Bruce Wayne")
let ironman = SuperHero(image: "ironman", name: "Iron Man", realName: "Tony Stark")
