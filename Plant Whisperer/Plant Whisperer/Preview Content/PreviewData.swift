//
//  PreviewData.swift
//  Plant Whisperer
//
//  Created by Jason Sanchez on 4/1/25.
//

import Foundation

struct PreviewData {
    static func loadVegetables() -> [Vegetable] {
        guard let url = Bundle.main.url(forResource: "vegetables", withExtension: "json") else {
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let vegetables = try JSONDecoder().decode([Vegetable].self, from: data)
            return vegetables
        } catch {
            return []
        }
    }
}
