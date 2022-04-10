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
    
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configures()
    }

    // MARK: - Configures
    func configures(){
        
    }
    
    //버튼이벤트
    @IBAction func placeOrderBtnClicked(_ sender: Any) {
    }
    
}
