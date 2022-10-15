//
//  Chapter.swift
//  Learning
//
//  Created by Anna Johnson on 10/12/22.
//

import Foundation
import UIKit

struct Chapter: Codable {
    var vocabulary: [Vocabulary]
    
    struct Vocabulary: Codable {
        var chapter: Int
        var section: [Section]
        
        struct Section: Codable {
            var number: Int
            var vocabSection: [VocabSection]
            
            struct VocabSection: Codable {
                var name: String
                var subsections: [Subsections]
                
                struct Subsections: Codable {
                    var name: String
                    var vocab: [Vocab]
                    
                    struct Vocab: Codable {
                        var word: String
                        var definition: String
                        var article: String
                        var gender: String
                    }
                }
            }
            
            
        }
    }
    
}
