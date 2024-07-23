//
//  RecipeService.swift
//  Simple Chef
//
//  Created by James Charron on 7/23/24.
//

import Foundation

class RecipeService {
    private let apiKey = "YOUR_API_KEY"
    private let baseURL = "https://api.spoonacular.com/recipes/findByIngredients"

    func fetchRecipes(ingredients: [String], completion: @escaping (Result<[Recipe], Error>) -> Void) {
        let ingredientsString = ingredients.joined(separator: ",")
        guard let url = URL(string: "\(baseURL)?ingredients=\(ingredientsString)&apiKey=\(apiKey)") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                return
            }

            do {
                let recipes = try JSONDecoder().decode([Recipe].self, from: data)
                completion(.success(recipes))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
