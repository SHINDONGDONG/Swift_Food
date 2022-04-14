//
//  AppError.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/15.
//

import Foundation


enum AppError: LocalizedError {
    case errorDecoding
    case unkownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
            
        case .errorDecoding:
            return "Resoponse colud not be decoded"
        case .unkownError:
            return "와이라노? 언노운이다"
        case .invalidUrl:
            return "URL 내놔랏!"
        case .serverError(let error):
            print("server error: \(error)")
            return error
        }
    }
}
