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
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    
    var categories:[DishCategory] = [
        .init(id: "id1", name: "aisan1", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "aisan2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "aisan3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "aisan4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "aisan5", image: "https://picsum.photos/100/200"),
    ]
    
    var populars : [Dish] = [
        .init(id: "id1", name: "garri", description: "헌법재판소에서 법률의 위헌결정, 탄핵의 결정, 정당해산의 결정 또는 헌법소원에 관한 인용결정을 할 때에는 재판관 6인 이상의 찬성이 있어야 한다. 훈장등의 영전은 이를 받은 자에게만 효력이 있고, 어떠한 특권도 이에 따르지 아니한다.행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 모든 국민은 고문을 받지 아니하며, 형사상 자기에게 불리한 진술을 강요당하지 아니한다.모든 국민은 근로의 권리를 가진다. 국가는 사회적·경제적 방법으로 근로자의 고용의 증진과 적정임금의 보장에 노력하여야 하며, 법률이 정하는 바에 의하여 최저임금제를 시행하여야 한다.모든 국민은 직업선택의 자유를 가진다. 모든 국민은 통신의 비밀을 침해받지 아니한다. 제2항과 제3항의 처분에 대하여는 법원에 제소할 수 없다. 모든 국민은 인간다운 생활을 할 권리를 가진다.대통령은 제1항과 제2항의 처분 또는 명령을 한 때에는 지체없이 국회에 보고하여 그 승인을 얻어야 한다. 국가는 농수산물의 수급균형과 유통구조의 개선에 노력하여 가격안정을 도모함으로써 농·어민의 이익을 보호한다.", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id2", name: "Chiken", description: "Your Chiken", image: "https://picsum.photos/100/200", calories: 1010),
        .init(id: "id3", name: "baka", description: "맛있똥", image: "https://picsum.photos/100/200", calories: 11),
        .init(id: "id4", name: "pizaa", description: "맛있똥", image: "https://picsum.photos/100/200", calories: 56),
        .init(id: "id5", name: "Yeah!", description: "맛있똥", image: "https://picsum.photos/100/200", calories: 1003),
    ]
    
    var specials: [Dish] = [
        .init(id: "id1", name: "Fried", description: "마늘맛", image: "https://picsum.photos/200/300 ", calories: 34),
        .init(id: "id2", name: "Pott", description: "Your Chiken", image: "https://picsum.photos/100/200", calories: 1010),
        .init(id: "id3", name: "Ham", description: "캬캬", image: "https://picsum.photos/100/200", calories: 11),
        .init(id: "id4", name: "Zizzz", description: "띵띵", image: "https://picsum.photos/100/200", calories: 56),
        .init(id: "id5", name: "순대국", description: "국밥", image: "https://picsum.photos/200/300", calories: 1003),
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
        
        specialsCollectionView.register(UINib(
            nibName: DishLandscapeCollectionViewCell.identifier,
            bundle: nil),
            forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
        

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
            //sepcial콜렉션 뷰일때
        case specialsCollectionView:
            return specials.count
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
        case specialsCollectionView:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath)
                    as? DishLandscapeCollectionViewCell else { return UICollectionViewCell() }
            //데이터를 cell에 populars배열로 보내준다.
            cell.setup(dish: specials[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            
        }else {
            let controller =
            DishDetailViewController.instantiate()
            //컨트롤러에서 dish 타입이 populars이면, specials이면
            //각각 다른 배열을 넘겨준다.
            controller.dish = collectionView ==
            popularCollectionView ?
            populars[indexPath.row] :
            specials [indexPath.row]
//            navigationController?.present(controller, animated: true)
            navigationController?.pushViewController(controller, animated: true)
            
        }
    }
    
    
}
