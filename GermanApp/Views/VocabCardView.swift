//
//  VocabCardView.swift
//  GermanApp
//
//  Created by Anna Johnson on 10/14/22.
//

import UIKit

class VocabCardView: UIView {

    let article: String
    let word: String
    let definition: String

    
    init(frame: CGRect, article: String, word: String, definition: String) {
        self.article = article
        self.word = word
        self.definition = definition

        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .white
        addSubview(addLabel(text: article, frame: CGRect(x: 25, y: 12, width: 50, height: 50), color: .lightGray))
        addSubview(addLabel(text: word, frame: CGRect(x: 80, y: 12, width: 150, height: 50), color: .black))
        addSubview(addLabel(text: definition, frame: CGRect(x: 250, y: 12, width: 150, height: 50), color: .black))
        layer.cornerRadius = 8


        
       
    }
    
    private func addLabel(text: String, frame: CGRect, color: UIColor) -> UILabel{
        let label = UILabel(frame: frame)
        label.text = text
        label.font = UIFont(name: "Avenir-Black", size: 18)
        label.textColor = color
        label.textAlignment = .center
        return label
        
    }

}
