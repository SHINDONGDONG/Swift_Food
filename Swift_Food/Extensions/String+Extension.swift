//
//  String+Extension.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/10.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
