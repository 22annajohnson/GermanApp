//
//  ChapterCardView.swift
//  Learning
//
//  Created by Anna Johnson on 10/14/22.
//

import UIKit

class ChapterCardView: UIView {
    
    let index: Int
    
    init(frame: CGRect, index: Int) {
        self.index = index

        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        let chapterView = UIView()
        chapterView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(chapterView)
        
        let chapterVm = ChapterViewModel(chapterIndex: index, sectionIndex: 0, subsectionIndex: 0, categoryIndex: 0)
        let number = chapterVm.number
        let germanNumber = convertToGerman(number: chapterVm.number)
        
        chapterView.addSubview(chapterLabel(germanNumber: germanNumber))
        chapterView.addSubview(chapterNumber(number: number))
        chapterView.addSubview(openArrow())
        
       
    }
    
    
    func chapterLabel(germanNumber: String) -> UILabel {
        
        
        let label = UILabel(frame: CGRect(x: 25, y: 50, width: 300, height: 100))
        label.text = "Kapital \(germanNumber)"
        label.font = UIFont(name: "Avenir-Black", size: 30)

        return label
        
    }
    
    func convertToGerman(number: Int) -> String {
        let numberArray = ["Null", "Eins", "Zwei", "Drei", "Vier"]
        let convertedNumber = numberArray[number]
        return convertedNumber
    }
    
    func chapterNumber(number: Int) -> UILabel {
        let label = UILabel(frame: CGRect(x: 260 , y: 50, width: 100, height: 100))
        label.text = String(number)
        label.font = UIFont(name: "Avenir-Black", size: 75.0)
        return label
    }

    
    func openArrow() -> UIImageView {
        let view = UIImageView(image: UIImage(systemName: "chevron.forward"))
        view.tintColor = .white
        view.layer.opacity = 0.65
        view.frame = CGRect(x: 320, y: 84, width: 25, height: 32)
        

        return view
    }
    



}
