//
//  SwipingViewController.swift
//  GermanApp
//
//  Created by Anna Johnson on 10/14/22.
//

import UIKit

class SwipingViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let chapterVm = ChapterViewModel(chapterIndex: 0, sectionIndex: 0, subsectionIndex: 0, categoryIndex: 0)

    
    @objc private func handlePrev() {
        let nextIndex = max(pageControl.currentPage - 1, 0)
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    

    
    private lazy var pageControl: UIPageControl = {
        let pageController = UIPageControl()

        pageController.currentPage = 0
        pageController.numberOfPages = chapterVm.subsectionCount

        pageController.currentPageIndicatorTintColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
        pageController.pageIndicatorTintColor = .lightGray
        return pageController
    }()
    
    fileprivate func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [pageControl])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBottomControls()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView?.isPagingEnabled = true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chapterVm.subsectionCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageCollectionViewCell
        
        var pages: [Page] = []
        let words = chapterVm.words
        let definitons = chapterVm.definitons
        let articles = chapterVm.articles
        var vocab: [Page.Vocab] = []
//        for i in 1 ... chapterVm.subsectionCount {
//            
//        }
            
        for i in 0...words.count-1 {
            vocab.append(Page.Vocab(word: words[i], article: articles[i], definition: definitons[i]))
        }
        
        for i in 0...chapterVm.subsectionCount-1 {
            pages.append(Page(titleText: "Volkben \(i+1)", vocab: vocab, sectionNumber: i))
        }
        
        
        let page = pages[indexPath.item]
        cell.page = page
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
