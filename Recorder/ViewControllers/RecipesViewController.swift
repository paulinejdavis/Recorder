//
//  RecipeViewController.swift
//  Recorder
//
//  Created by Pauline on 29/08/2024.
//

import Foundation
import UIKit

class RecipesViewController: BaseCollectionViewController<Recipe> {

    let viewModel: RecipeViewModelProtocol

    init(viewModel: RecipeViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(items: viewModel.recipes)
        
        // Now, set the closures after the `super.init` call
        self.configureCell = { cell, recipe in
            guard let recipeCell = cell as? RecipeCollectionViewCell else { return }
            recipeCell.configure(with: recipe)
        }
        
        self.didSelectItem = { [weak self] recipe in
            guard let self = self else { return }
            let detailVC = RecipeDetailViewController(recipe: recipe)
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecipeLogo()
    }

    private func setupRecipeLogo() {
        // Additional UI setup for the logo and other elements
    }
}
