//
//  DishDetailViewController.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/11.
//

import UIKit

class DishDetailViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var dishImageView: UIImageView! //image
    @IBOutlet weak var titleLbl: UILabel! //왼라벨
    @IBOutlet weak var caloriesLbl: UILabel! //빨간라벨
    @IBOutlet weak var descriptionLbl: UILabel! //가운데라벨
    @IBOutlet weak var nameField: UITextField! //주문자성명
    
    var dish:Dish!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configures()
    }

    // MARK: - Configures
    func configures(){
        populateView()
    }
    
    private func populateView() {
        //image에 dish image를 담고
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        //detail텍스트에 dish.name배열을 담고
        titleLbl.text = dish.name
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
        
    }
    
    //버튼이벤트
    @IBAction func placeOrderBtnClicked(_ sender: Any) {
    }
    
}
