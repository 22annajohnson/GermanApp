//
//  Pages.swift
//  GermanApp
//
//  Created by Anna Johnson on 10/15/22.
//

import Foundation
import UIKit

struct Page {
    let titleText: String
    let vocab: [Vocab]
    let sectionNumber: Int
//    let subsectionNumber: Int
    
    struct Vocab: Codable {
        let word: String
        let article: String
        let definition: String
    }
    
}
