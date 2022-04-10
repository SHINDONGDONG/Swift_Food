//
//  CardView.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/10.
//

import Foundation
import UIKit

class CardView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initalSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initalSetup()
    }
    
    
    private func initalSetup(){
        //그림자는 블랙으로
        layer.shadowColor = UIColor.black.cgColor
        //옵셋 제로
        layer.shadowOffset = .zero
        //카드 모서리 둥글게
        layer.cornerRadius = 10
        //투명도
        layer.shadowOpacity = 0.1
        cornerRadius = 10
    }
}
