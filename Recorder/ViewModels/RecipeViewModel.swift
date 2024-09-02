//
//  RecipeViewModel.swift
//  Recorder
//
//  Created by Pauline on 29/08/2024.
//

import UIKit
import Foundation

struct Recipe {
    var title: String
    var description: String
    var image: UIImage?
    var ingredients: [String]
}


struct RecipeViewModel: RecipeViewModelProtocol {
    var recipes: [Recipe] = [
        Recipe(
            title: "No-barrel Jerk Chicken",
            description: "A spicy flavourful chicken recipe without the traditional barrel cooking.",
            image: {
                let image = UIImage(named: "jerk_chicken")
                if  image == nil {
                    print("image not found")
                }
                return image
            }(),
            ingredients: ["A spicy flavourful chicken recipe without the traditional barrel cooking."]
            
        ),
        Recipe(
            title: "Saltfish Fritters",
            description: "A spicy flavourful chicken recipe with the traditional homemade cooking.",
            image: {
                let image = UIImage(named: "saltfish_fritters")
                if  image == nil {
                    print("image not found")
                }
                return image
            }(),
            ingredients: ["A spicy flavourful saltfish recipe with the traditional Carib cooking."]
            
        ),
        Recipe(
            title: "Patties",
            description: "A spicy pattie with lashes of flavour.",
            image: {
                let image = UIImage(named: "patties")
                if  image == nil {
                    print("image not found")
                }
                return image
            }(),
            ingredients: ["A spicy blah blah recipe without the traditional Carib cooking."]
            
        ),
        Recipe(
            title: "Banana Bread",
            description: "A flavourful spiced bun recipe without the traditional Caribbean cooking.",
            image: {
                let image = UIImage(named: "banana_bread")
                if  image == nil {
                    print("image not found")
                }
                return image
            }(),
            ingredients: ["A spicy bun recipe without the traditional Caribbean cooking."]
            
        ),
        Recipe(
            title: "Fried Plaintain",
            description: "The simple things are the best.",
            image: {
                let image = UIImage(named: "fried_plaintain")
                if  image == nil {
                    print("image not found")
                }
                return image
            }(),
            ingredients: ["A spicy flavourful recipe with traditional Carib cooking vibrations."]
            
        ),
        Recipe(
            title: "Stew Chicken",
            description: "The simple things are the best.",
            image: {
                let image = UIImage(named: "stew_chicken")
                if  image == nil {
                    print("image not found")
                }
                return image
            }(),
            ingredients: ["A spicy flavourful chicken recipe with the traditional Carib cooking."]
    
    
    )]
}
