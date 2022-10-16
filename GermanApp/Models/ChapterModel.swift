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
    var words: [String]
    var definitons: [String]
    var articles: [String]
    let numberOfWords: Int
    let numberOfSubsections: Int

    var sectionTitles: [String]
    
    init (data: Chapter, chapterIndex: Int, sectionIndex: Int, subsectionIndex: Int, categoryIndex: Int) {
        chapterNumber = data.vocabulary[chapterIndex].chapter
        vocabNumber = data.vocabulary[chapterIndex].section[sectionIndex].number
        numberOfWords = data.vocabulary[chapterIndex].section[sectionIndex].vocabSection[subsectionIndex].subsections[categoryIndex].vocab.count
        numberOfSubsections = data.vocabulary[chapterIndex].section[sectionIndex].vocabSection[subsectionIndex].subsections.count
        sectionTitles = []
        words = []
        definitons = []
        articles = []
        

        for index in 0 ... (numberOfWords-1) {
            words.append(data.vocabulary[chapterIndex].section[sectionIndex].vocabSection[subsectionIndex].subsections[categoryIndex].vocab[index].word)
            definitons.append(data.vocabulary[chapterIndex].section[sectionIndex].vocabSection[subsectionIndex].subsections[0].vocab[index].definition)
            articles.append(data.vocabulary[chapterIndex].section[sectionIndex].vocabSection[subsectionIndex].subsections[categoryIndex].vocab[index].article)
        }
        
        for index in 0 ... (numberOfSubsections-1) {
            sectionTitles.append(data.vocabulary[chapterIndex].section[sectionIndex].vocabSection[subsectionIndex].subsections[index].name)
        }
    }
}
