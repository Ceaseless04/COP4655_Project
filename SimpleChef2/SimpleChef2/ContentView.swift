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
                    }.padding(.top)
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
           description: "Juice and savory, perfect for sauces or added moisture."),
    Ingredient(imageName: "PeanutButter",
           name: "Peanut Butter",
           description: "Yum")
]

//--------------------------------------------------
// Custom list view cell
struct IngredientButton: View {
    let ingredient: Ingredient // Data for a single person
    @State var selected = false
    var body: some View {

        VStack {
            Button(action: {selected.toggle()})
            {
                Image(ingredient.imageName) // Load the image from assets
                    .resizable()
                    .padding(.all, 5.0)
                    .frame(width: 95, height: 95) // Set image size
                    .overlay( Circle()
                        .stroke(selected ? Color.blue : Color.black, lineWidth: 5)
                        .frame(width: 110, height: 110)
                    )

            }
                Text(ingredient.name) // Display the ingredient's name
                    .font(.headline)
                    .lineLimit(1) // Limit the description to one line
        }// HVtack
    }// end body
}

#Preview {
    ContentView()
}
