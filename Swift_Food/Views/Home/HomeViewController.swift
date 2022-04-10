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
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    
    var categories:[DishCategory] = [
        .init(id: "id1", name: "aisan1", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "aisan2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "aisan3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "aisan4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "aisan5", image: "https://picsum.photos/100/200"),
    ]
    
    var populars : [Dish] = [
        .init(id: "id1", name: "garri", description: "맛있똥", image: "https://picsum.photos/100/200", calories: 34),
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
        
        popularCollectionView.register(UINib(
            nibName: DishPortraitCollectionViewCell.identifier,
            bundle: nil),
            forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
    }
}

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            //스위치로 categoryCollectionView일땐
        case categoryCollectionView:
            //categories를 카운트로 가져온다.
            return categories.count
        case popularCollectionView:
            return populars.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
            //collectionview가 categoricollectionview일땐 카테고리 컬렉션으로 만들어준다.
        case categoryCollectionView:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath)
                    as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            //데이터를 cell에 categories배열로 보내준다.
            cell.setup(category: categories[indexPath.row])
            return cell
            //collectionview가 popular일땐 카테고리 컬렉션으로 만들어준다.
        case popularCollectionView:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath)
                    as? DishPortraitCollectionViewCell else { return UICollectionViewCell() }
            //데이터를 cell에 populars배열로 보내준다.
            cell.setup(dish: populars[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
        
    }
    
    
}
