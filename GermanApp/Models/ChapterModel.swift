//
//  ChapterModel.swift
//  Learning
//
//  Created by Anna Johnson on 10/12/22.
//

import Foundation

struct ChapterModel {
    var chapterNumber: Int
    var vocabNumber: Int
    
    init (data: Chapter, chapterIndex: Int) {
        chapterNumber = data.vocabulary[chapterIndex].chapter
        vocabNumber = data.vocabulary[chapterIndex].section[0].number
    }
}
