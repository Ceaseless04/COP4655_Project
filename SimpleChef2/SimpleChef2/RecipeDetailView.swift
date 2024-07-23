//
//  RecipeDetailView.swift
//  Simple Chef
//
//  Created by James Charron on 7/23/24.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: recipe.image))
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()

                Text("Ingredients")
                    .font(.headline)
                    .padding([.top, .leading, .trailing])

                ForEach(recipe.ingredients, id: \.id) { ingredient in
                    Text(ingredient.name)
                        .padding(.horizontal)
                }

                Text("Instructions")
                    .font(.headline)
                    .padding([.top, .leading, .trailing])

                Text(recipe.instructions)
                    .padding()
            }
        }
        .navigationTitle(recipe.title)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: Recipe(id: 1, title: "Sample Recipe", image: "https://via.placeholder.com/150", ingredients: [Ingredient(id: 1, name: "Sample Ingredient")], instructions: "Sample instructions"))
    }
}
