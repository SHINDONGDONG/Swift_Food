//
//  OnboardingCollectionViewCell.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/09.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLbl: UILabel!
    @IBOutlet weak var slideDescriptionLbl: UILabel!
    
    
    
    //MARK: - Configures
    //모델에 셋업할 메소드를 만들어준다.
    //그러면 onboardingSlide 모델에 셋팅된녀석들이 이쪽으로 흘러들어오게된다
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLbl.text = slide.title
        slideDescriptionLbl.text = slide.description
    }
    
}
 
