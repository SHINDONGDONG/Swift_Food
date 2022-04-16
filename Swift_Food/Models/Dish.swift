//
//  Dish.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/10.
//

import Foundation

struct Dish: Codable {
    let id, name, description, image: String?
    let calories: Int?
    
    //칼로리를 스트링값으로 반환하는 메서드
    var formattedCalories: String {
        return "칼로리 : \(calories ?? 0)"
//        String(format: "칼로리 : %.2f", calories ?? 0)
    }
}
