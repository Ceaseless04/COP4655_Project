//
//  RecipeViewModel.swift
//  Simple Chef
//
//  Created by James Charron on 7/23/24.
//

import SwiftUI
import Combine

class RecipeViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    private let recipeService = RecipeService()
    private var cancellables = Set<AnyCancellable>()

    func fetchRecipes(ingredients: [String]) {
        recipeService.fetchRecipes(ingredients: ingredients) { [weak self] result in
            switch result {
            case .success(let recipes):
                DispatchQueue.main.async {
                    self?.recipes = recipes
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
