//
//  HomeViewController.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/10.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    var categories:[DishCategory] = [
        .init(id: "id1", name: "aisan1", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "aisan2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "aisan3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "aisan4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "aisan5", image: "https://picsum.photos/100/200"),
    ]
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configures()
    }

    // MARK: - Configures
    func configures(){
//        title = "Yummie"
        registerCells()
    }
    
    //cells를 레지스터 등록한다,
    private func registerCells(){
        //nib파일의 cell을 레지스터로 등록한다.
        categoryCollectionView.register(UINib(
            nibName: CategoryCollectionViewCell.identifier,
            bundle: nil),
            forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
}

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)
                as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        //데이터를 cell에 categories배열로 보내준다.
        cell.setup(category: categories[indexPath.row])
        return cell
    }
    
    
}
