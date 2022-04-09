//
//  OnboardingViewController.swift
//  Swift_Food
//
//  Created by 申民鐡 on 2022/04/09.
//

import UIKit

class OnboardingViewController: UIViewController {

    // MARK: - Properties
    //currentPage의 전역변수를 만들어준다.
     var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            //currentPage에서 didSet으로 sildeds카운트와 같다면
            //주문하러 들어가는것이고
            if currentPage == slides.count - 1 {
                nextButton.setTitle("시작하기", for: .normal)
            }else {
                //아직 볼게있다면 버튼타이틀이 다음인 설정으로 만들어준다.
                nextButton.setTitle("다음", for: .normal)
            }
        }
    }
    
    var slides: [OnboardingSlide] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
    slides = [
        OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different", image: UIImage(named: "slide1" )!),
        OnboardingSlide(title: "Delicious Dishes", description: "내 탕수육!!", image: UIImage(named: "slide2" )!),
        OnboardingSlide(title: "Delicious Dishes", description: "역시 피자보단 치킨이지?", image: UIImage(named: "slide3" )!),
    ]
    }
    

    // MARK: - Configures
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count-1 {
            //스토리보드에 있는 navigation controller 의 identifier를 명시해주고
            //그것이 navigation controller라는것을 강조하는 as! 로 선언한다.
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC")
            as! UINavigationController
            
            //fluu screen으로 화면을 이동시킨다.
            controller.modalPresentationStyle = .fullScreen
            //화면의 트랜지션 스타일을 바꿔준다.
            controller.modalTransitionStyle = .flipHorizontal
            //present로 이동을 하게되면 밑에서 위로 다 차지않는 화면으로 이동함.
            present(controller, animated: true, completion: nil)
            
        }else {
            //버튼으로 이벤트발생시 paging을 안먹히게됨. false로 만들어준다.
            collectionView.isPagingEnabled = false
            //마지막 페이지가 아니면 페이지를1 올려준다.
            currentPage += 1
            //indexpath에 IndexPath(item을 현재페이지 인덱스,섹션 0)
            let indexPath = IndexPath(item: currentPage, section: 0)
            //scrolltoItem으로 페이지를 이동시켜준다.
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        //다시 페이징을 true로 해주어야 슬라이드때 먹힌다.
        collectionView.isPagingEnabled = true
    }
    
}

extension OnboardingViewController:
    UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //넓이를 구함.
        let width = scrollView.frame  .width
//        currentpage에 scrollview.contentoffset.x를 넣고 width를 나눠준다.
        //왜 contentoffset.x를 width로 나누냐면 같은크기이지만 contentoffset.x는옆으로
        //넘어가면 그 크기가 두 배가되어서 나누면 0,1,2 가되므로 currentpage를 지정할 수 있다.
        currentPage = Int(scrollView.contentOffset.x / width)
//        pageControl.currentPage = currentPage
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
                        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as?
                OnboardingCollectionViewCell else { return UICollectionViewCell() }
        
        //OnboardingCollectionViewCell의 setup에 slides를 넘겨준다.
        cell.setup(slides[indexPath.row])
        return cell
    }
    
}
