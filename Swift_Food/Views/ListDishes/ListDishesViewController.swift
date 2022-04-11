//
//  ListDishesViewController.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/12.
//

import UIKit

class ListDishesViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var category:DishCategory!
    
    
    var dishes: [Dish] = [
        .init(id: "id1", name: "garri", description: "헌법재판소에서 법률의 위헌결정, 탄핵의 결정, 정당해산의 결정 또는 헌법소원에 관한 인용결정을 할 때에는 재판관 6인 이상의 찬성이 있어야 한다. 훈장등의 영전은 이를 받은 자에게만 효력이 있고, 어떠한 특권도 이에 따르지 아니한다.행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 모든 국민은 고문을 받지 아니하며, 형사상 자기에게 불리한 진술을 강요당하지 아니한다.모든 국민은 근로의 권리를 가진다. 국가는 사회적·경제적 ", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id2", name: "Chiken", description: "Your Chiken", image: "https://picsum.photos/100/200", calories: 1010),
        .init(id: "id3", name: "baka", description: "맛있똥", image: "https://picsum.photos/100/200", calories: 11),
        .init(id: "id4", name: "pizaa", description: "맛있똥", image: "https://picsum.photos/100/200", calories: 56),
        .init(id: "id5", name: "Yeah!", description: "맛있똥", image: "https://picsum.photos/100/200", calories: 1003),
    ]
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configures()
    }
    

    // MARK: - Configures
    func configures(){
        title = category.name
        registerCells()
    }
    
    private func registerCells() {
        tableView.register(UINib(
            nibName: DishListTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: DishListTableViewCell.identifier)
    }

}
// MARK: - extension
extension ListDishesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //dishes를 카운터로 돌려줌.
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //dishlisttableviewcell을 deq으로 등록했다.
        let cell =
        tableView.dequeueReusableCell(
            withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        //cell에 셋업해줌.
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
