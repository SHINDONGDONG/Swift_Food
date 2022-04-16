//
//  ApiResponse.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/15.
//

import Foundation


struct ApiResponse<T: Codable>:Codable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}

/**
 
 {"status":200,"message":"Success","data":{"categories":[{"id":"cat1","title":"Snacks","image":"https://res.cloudinary.com/dn4pokov0/image/upload/v1611311563/d3f69e36ea17c0e0bb129ba1403e24dc.png"},
 
 */
