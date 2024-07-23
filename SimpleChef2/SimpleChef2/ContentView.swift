//
//  ContentView.swift
//  SimpleChef2
//
//  Created by SpiderSolo on 7/23/24.
//

import SwiftUI

struct ContentView: View {
    let layout = [
        GridItem(.adaptive(minimum:100))
    ]
    var body: some View {
        VStack {
            Text("Select your ingredients!")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 10.0)
                .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/)
            ScrollView {

                
                LazyVGrid(columns: layout) {
                    ForEach(sampleData) { datum in
                        IngredientButton(ingredient: datum)
                    }
                }
                
                
            }// end ScrollView
            .padding()
        }//end VStack
    }//end Body
}//end contentView


// Model representing an ingredient
struct Ingredient: Identifiable, Hashable {
    let id = UUID() // Unique identifier for each person
    let imageName: String // Name of the image in the asset catalog
    let name: String // Name of the ingredient
    let description: String // Short description of the ingredient
}

//--------------------------------------------------

// Sample data
let sampleData = [
    Ingredient(imageName: "Bread",
           name: "Bread",
           description: "A must have for any sandwich."),
    Ingredient(imageName: "Eggs",
           name: "Eggs",
           description: "Chicken eggs, cookable in hundreds of ways."),
    Ingredient(imageName: "Milk",
           name: "Milk",
           description: "Classic cow milk, any fat percent or vegan substitute can work."),
    Ingredient(imageName: "Tomato",
           name: "Tomato",
           description: "Juice and savory, perfect for sauces or added moisture.")
]

//--------------------------------------------------
// Custom list view cell
struct IngredientButton: View {
    let ingredient: Ingredient // Data for a single person

    var body: some View {
        VStack {
            Image(ingredient.imageName) // Load the image from assets
                .resizable()
                .frame(width: 100, height: 100) // Set image size
                .clipShape(Circle()) // Make the image circular
                .padding(.trailing, 10)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/3/*@END_MENU_TOKEN@*/) // Add padding to the right of the image
                Text(ingredient.name) // Display the person's name
                    .font(.headline)
                    .lineLimit(1) // Limit the description to one line
        }// HVtack
    }// end body
}

#Preview {
    ContentView()
}
