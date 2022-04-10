//
//  DishPortraitCollectionViewCell.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/10.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {
    //identifier
    static let identifier = String(describing: DishPortraitCollectionViewCell.self)
    
    //1 라벨
    @IBOutlet weak var titleLbl: UILabel!
    //2 이미지뷰
    @IBOutlet weak var dishImageView: UIImageView!
    //3 라벨
    @IBOutlet weak var caloriesLbl: UILabel!
    //4 라벨
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    func setup(dish: Dish) {
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
}
