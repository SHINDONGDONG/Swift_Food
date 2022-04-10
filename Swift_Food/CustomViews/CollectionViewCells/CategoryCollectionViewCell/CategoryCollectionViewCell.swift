//
//  CategoryCollectionViewCell.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/10.
//

import UIKit
//kingfisher 를 사용한다.
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    func setup(category: DishCategory){
        //DishCategory에서 받아오는 name image URL을 넣어준다.
        categoryTitleLbl.text = category.name
        //String을 extension해주었기 때문에 아래같이 적어도 string을 리턴해주는것으로
        //보여지는것이기 때문에 에러가 뜨지않는다.
        categoryImageView.kf.setImage(with: category.image.asUrl)
    }
    
}
