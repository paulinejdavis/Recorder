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
            title: "No-barrel Jerk Chicken2",
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
            title: "No-barrel Jerk Chicken2",
            description: "A spicy flavourful chicken recipe without the traditional barrel cooking.",
            image: {
                let image = UIImage(named: "jerk_chicken")
                if  image == nil {
                    print("image not found")
                }
                return image
            }(),
            ingredients: ["A spicy flavourful chicken recipe without the traditional barrel cooking."]
            
        )
    
    
    ]
}
