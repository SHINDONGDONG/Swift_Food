//
//  Route.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/13.
//

import Foundation

enum Route {
    //baseURL을 만들어준다.
    static let baseUrl = "https://yummie.glitch.me"
    
    //임시경로
    case temp
    
    //switch로 temp일땐 이 경로,
    //다른거일땐 다른경로 로 가라고 정해줌
    var description: String {
        switch self {
        case .temp:
            return "/dishes/cat1"
        }
    }
}
