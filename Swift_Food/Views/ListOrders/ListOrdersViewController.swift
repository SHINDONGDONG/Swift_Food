//
//  ListOrdersViewController.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/13.
//

import UIKit

class ListOrdersViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "id", name: "Shin kawa", dish: .init(id: "id2", name: "Chiken", description: "Your Chiken", image: "https://picsum.photos/100/200", calories: 1010)),
        .init(id: "id", name: "a", dish: .init(id: "id2", name: "takoyaki", description: "Your Chiken", image: "https://picsum.photos/100/200", calories: 1010)),
        .init(id: "id", name: "Shin kawa", dish: .init(id: "id2", name: "Fried", description: "Your Chiken", image: "https://picsum.photos/100/200", calories: 1010))
    ]
    
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configures()
    }

    //MARK: - Configures
    func configures(){
        registers()
    }
    
    private func registers() {
        //dishlisttableviewcell의 화면을 리스트오더에 레지스트 등록을 해줄것.
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

//MARK: - Extensions
extension ListOrdersViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath)
        as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //dishdetail을 컨트롤러에 넣어준다음.
        let controller = DishDetailViewController.instantiate()
        //detail의 dish가 들어가있는데 order에는 dish가 구성으로 들어가있어서 dish를넣어줘야함.
        controller.dish = orders[indexPath.row].dish
//        present(controller, animated: true)
        navigationController?.pushViewController(controller, animated: true)
        
    }
    
}
