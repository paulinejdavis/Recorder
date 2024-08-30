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
        self.configureImageLogo = { (imageView: UIImageView) in
            imageView.image = UIImage(named: "recipe_logo")
            //base controller -places in hierarchy see block lines 20 for deets
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecipeLogo()
        //setupCollectionView()
    }

    private func setupRecipeLogo() {
        // Additional UI setup for the logo and other elements
        //create
        
        uniqueLogo.image = UIImage(named: "recipe_logo")
    
        if uniqueLogo.image == nil {
                print("Recipe logo not found")
            }
        uniqueLogo.contentMode = .scaleAspectFit
        
       
        view.addSubview(uniqueLogo)
       
        uniqueLogo.translatesAutoresizingMaskIntoConstraints = false
       
        
        // Set up constraints for uniqueLogo
        NSLayoutConstraint.activate([
                // Position uniqueLogo below separatorView
                uniqueLogo.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
                uniqueLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                uniqueLogo.widthAnchor.constraint(equalToConstant: 300),
                uniqueLogo.heightAnchor.constraint(equalToConstant: 100),

                // Position collectionView below uniqueLogo
                collectionView.topAnchor.constraint(equalTo: uniqueLogo.bottomAnchor, constant: 60),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                                                
            ])

    }
}
