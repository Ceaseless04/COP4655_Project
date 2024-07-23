//
//  RecipeRow.swift
//  Simple Chef
//
//  Created by James Charron on 7/23/24.
//

import SwiftUI

struct RecipeRow: View {
    let recipe: Recipe

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: recipe.image))
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(recipe.title)
                .font(.headline)
        }
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(recipe: Recipe(id: 1, title: "Sample Recipe", image: "https://via.placeholder.com/150", ingredients: [], instructions: ""))
    }
}
