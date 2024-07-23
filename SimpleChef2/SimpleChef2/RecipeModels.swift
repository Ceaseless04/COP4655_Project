//
//  RecipeModels.swift
//  Simple Chef
//
//  Created by James Charron on 7/23/24.
//

import Foundation

struct Recipe: Identifiable, Decodable {
    let id: Int
    let title: String
    let image: String
    let ingredients: [Ingredient]
    let instructions: String
}

struct Ingredient: Identifiable, Decodable, Hashable {
    let id: UUID = UUID()
    let imageName: String
    let name: String
    let description: String
}
