//
//  readLocalJSONFile.swift
//  Learning
//
//  Created by Anna Johnson on 10/12/22.
//

import Foundation

class FileLoader {
    
    static func readLocalFile(_ filename: String) -> Data? {
        guard let file = Bundle.main.path(forResource: filename, ofType: "json")
            else {
                fatalError("Unable to locate file \"\(filename)\" in main bundle.")
        }
        
        do {
            return try String(contentsOfFile: file).data(using: .utf8)
        } catch {
            fatalError("Unable to load \"\(filename)\" from main bundle:\n\(error)")
        }
    }
    
    
    static func loadJson(_ data: Data) -> Chapter {
        do {
            return try JSONDecoder().decode(Chapter.self, from: data)
        } catch {
            fatalError("Unable to decode  \"\(data)\" as \(Chapter.self):\n\(error)")
        }
    }
}
