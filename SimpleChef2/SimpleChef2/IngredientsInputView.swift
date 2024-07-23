//
//  IngredientsInputView.swift
//  Simple Chef
//
//  Created by James Charron on 7/23/24.
//

import SwiftUI

struct IngredientsInputView: View {
    @Binding var selectedIngredients: [String]

    var body: some View {
        VStack {
            Text("What Ingredients do you have?")
                .font(.headline)
                .padding()

            HStack {
                Button(action: { selectedIngredients.append("Tomato") }) {
                    IngredientIcon(name: "Tomato")
                }
                Button(action: { selectedIngredients.append("Bread") }) {
                    IngredientIcon(name: "Bread")
                }
                // Add more buttons as needed
            }
        }
    }
}

struct IngredientIcon: View {
    var name: String

    var body: some View {
        Text(name)
            .padding()
            .background(Color.gray)
            .cornerRadius(10)
            .foregroundColor(.white)
    }
}

struct IngredientsInputView_Previews: PreviewProvider {
    @State static var ingredients = [String]()

    static var previews: some View {
        IngredientsInputView(selectedIngredients: $ingredients)
    }
}
