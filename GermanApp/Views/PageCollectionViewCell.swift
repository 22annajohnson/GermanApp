//
//  PageCollectionViewCell.swift
//  GermanApp
//
//  Created by Anna Johnson on 10/15/22.
//

import UIKit

class PageCollectionViewCell: UICollectionViewCell {
    var tableView = UITableView()

    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }

            
            let attributedText = NSMutableAttributedString(string: "Test", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32)])
            
            attributedText.append(NSAttributedString(string: "\n\n\(unwrappedPage.titleText)", attributes: [NSAttributedString.Key.font: UIFont(name: "Avenir-Black", size: 30)!, NSAttributedString.Key.foregroundColor: UIColor.white]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
            
            
        }
    }
    

 
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupLayout()
    }
    
    private func setupLayout() {
      
        addSubview(descriptionTextView)
        
        descriptionTextView.topAnchor.constraint(equalTo: topAnchor, constant: -10).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: topAnchor, constant: 150).isActive = true
        
        let scrollView = UIScrollView(frame: CGRect(x: 10, y: 125, width: bounds.width-20, height: bounds.height-275))
        addSubview(scrollView)

        
        let view = VocabCardView(frame: CGRect(x: 0, y: 0, width: bounds.width-20, height: 75), article: "String", word: "String", definition: "String")
        scrollView.addSubview(view)
        
        tableView.frame = CGRect(x: 0, y: 0, width: bounds.width-20, height: bounds.height-250)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        scrollView.addSubview(tableView)
    }


    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageCollectionViewCell: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chapterVm = ChapterViewModel(chapterIndex: 0, sectionIndex: page!.sectionNumber, subsectionIndex: 0, categoryIndex: indexPath.section)

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let view: UIView = VocabCardView(frame: CGRect(x: 0, y: 0, width: bounds.width-20, height: 75), article: chapterVm.articles[indexPath.row], word: chapterVm.words[indexPath.row], definition: chapterVm.definitons[indexPath.row])
        cell.addSubview(view)
        
        
        cell.layer.cornerRadius = 8
        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        let chapterVm = ChapterViewModel(chapterIndex: 0, sectionIndex: page!.sectionNumber, subsectionIndex: 0, categoryIndex: 0)

        return chapterVm.subsectionCount
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let chapterVm = ChapterViewModel(chapterIndex: 0, sectionIndex: page!.sectionNumber, subsectionIndex: 0, categoryIndex: section)

        return chapterVm.wordCount
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let chapterVm = ChapterViewModel(chapterIndex: 0, sectionIndex: page!.sectionNumber, subsectionIndex: 0, categoryIndex: section)
        print(page!.sectionNumber)

        return chapterVm.subsectionName[section]
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 90
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30

    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let view = view as? UITableViewHeaderFooterView {
            view.textLabel?.backgroundColor = UIColor.clear
            view.textLabel?.textColor = .lightText
            view.textLabel?.font = UIFont(name: "Avenir-Black", size: 18)
        }
    }
    
    
}

//
//
