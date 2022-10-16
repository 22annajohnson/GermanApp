//
//  ChapterViewModel.swift
//  Learning
//
//  Created by Anna Johnson on 10/12/22.
//

import Foundation

class ChapterViewModel: ObservableObject {
    @Published private var chapterModel: ChapterModel
    let chapterIndex: Int
    let sectionIndex: Int
    let subsectionIndex: Int
    let categoryIndex: Int

    
    init(chapterIndex:Int, sectionIndex: Int, subsectionIndex: Int, categoryIndex: Int) {
        self.chapterIndex = chapterIndex
        self.sectionIndex = sectionIndex
        self.subsectionIndex = subsectionIndex
        self.categoryIndex = categoryIndex
        guard let data = FileLoader.readLocalFile("test")
            else {
                fatalError("Unable to locate file \"test.json\" in main bundle.")
        }
    
        let rawVocab = FileLoader.loadJson(data)
        chapterModel = ChapterModel(data: rawVocab, chapterIndex: chapterIndex, sectionIndex: sectionIndex, subsectionIndex: subsectionIndex, categoryIndex: categoryIndex)
    }
    
    var number: Int {
        get { chapterModel.chapterNumber }
    }
    
    var section: Int {
        get { chapterModel.vocabNumber }
    }
    
    var definitons: [String] {
        get { chapterModel.definitons }
    }
    
    var articles: [String] {
        get { chapterModel.articles }
    }
    
    var words: [String] {
        get { chapterModel.words }
    }
    
    var wordCount: Int {
        get { chapterModel.numberOfWords }
    }
    
    var subsectionCount: Int {
        get { chapterModel.numberOfSubsections }
    }
    
    var subsectionName: [String] {
        get { chapterModel.sectionTitles }
    }
}
