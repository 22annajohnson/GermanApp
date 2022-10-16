//
//  ChapterCardViewController.swift
//  Learning
//
//  Created by Anna Johnson on 10/13/22.
//

import UIKit

class ChapterCardViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chapters"
        self.navigationController!.navigationBar.barStyle = .black
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "Avenir-Black", size: 28)!]
        
        self.navigationController?.navigationBar.barTintColor = .red

        view.backgroundColor = .systemBackground
        
        var yPosition: Int = 130
        let colors = [
            UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1),
            UIColor.init(red: 0/255, green: 191/255, blue: 144/255, alpha: 1),
            UIColor.init(red: 191/255, green: 143/255, blue: 247/255, alpha: 1)
        ]


        for i in 1...3 {
            let width = Int(view.bounds.width)
            let chapterView = ChapterCardView(frame: CGRect(x: 25, y: yPosition, width: width - 50, height: 200), index: i-1)
            chapterView.layer.cornerRadius = 8
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
            chapterView.addGestureRecognizer(tapGestureRecognizer)
            
            view.addSubview(chapterView)
            chapterView.backgroundColor = colors[i-1]
            yPosition = yPosition + 235
            
        }

    }
    
    @objc func didTapView(_ sender: UITapGestureRecognizer) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let swipingController = SwipingViewController(collectionViewLayout: layout)
        self.navigationController?.pushViewController(swipingController, animated: true)
        
    }

}
