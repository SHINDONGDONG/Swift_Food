//
//  DishListTableViewCell.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/12.
//

import UIKit
import Kingfisher

class DishListTableViewCell: UITableViewCell {
    static let identifier = String(describing: DishListTableViewCell.self)
    
    @IBOutlet weak var disImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    //cell에 들어갈 데이터를 셋업해준다.
    func setup(dish: Dish) {
        disImageView.kf.setImage(with: dish.image?.asUrl)
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
    }
    
    func setup(order: Order) {
        disImageView.kf.setImage(with: order.dish?.image?.asUrl)
        titleLbl.text = order.dish?.name
        descriptionLbl.text = order.dish?.description
    }

}
