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
    
    init(chapterIndex:Int) {
        self.chapterIndex = chapterIndex
        guard let data = FileLoader.readLocalFile("test")
            else {
                fatalError("Unable to locate file \"test.json\" in main bundle.")
        }
    
        let rawVocab = FileLoader.loadJson(data)
        chapterModel = ChapterModel(data: rawVocab, chapterIndex: chapterIndex)
    }
    
    var number: Int {
        get { chapterModel.chapterNumber }
    }
    
    var section: Int {
        get { chapterModel.vocabNumber }
    }
}
