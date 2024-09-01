//
//  HomeViewController.swift
//  Recorder
//
//  Created by Pauline on 28/08/2024.
//

import UIKit

//struct Recipe {
//    //populste here withb name and images
//}
//
//// WIP: Create an actual ReceiptViewModel conforming to ReceiptViewModelProtocol
//protocol ReceiptViewModelProtocol {
//    var recipes: [Recipe] { get }
//}


class BaseCollectionViewController<T>: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var items: [T]
    var configureCell: ((UICollectionViewCell, T) -> Void)?
    var didSelectItem: ((T) -> Void)?
    
    // Shared UI elements
    let appLogoImageView = UIImageView()
    let separatorView = UIView()
    
    let uniqueLogo = UIImageView()
    var imageLogo: UIImage?
    var configureImageLogo: ((UIImageView) -> Void)?
    
    // Collection view
    internal let collectionView: UICollectionView
    
    init(items: [T]) {
        self.items = items
        
        let layout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        super.init(nibName: nil, bundle: nil)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        if let configureImageLogo = self.configureImageLogo {
            configureImageLogo(self.uniqueLogo)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCommonUI()
        setupCollectionView()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.minimumInteritemSpacing = 0 // No spacing between items
                layout.minimumLineSpacing = 0 // No spacing between lines
                layout.sectionInset = .zero // No section insets
            }
    }
    
    private func setupCommonUI() {
        
        view.backgroundColor = .white
        // Configure App Logo
        appLogoImageView.image = UIImage(named: "app_logo")
        if appLogoImageView.image == nil {
                print("App logo not found")
            }
        appLogoImageView.contentMode = .scaleAspectFit
        view.addSubview(appLogoImageView)

        // Configure Separator
        separatorView.backgroundColor = .gray
        view.addSubview(separatorView)

        // Layout the common UI elements
        appLogoImageView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // App Logo constraints
            appLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            appLogoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10), // Position to the left
            appLogoImageView.heightAnchor.constraint(equalToConstant: 60),
            appLogoImageView.widthAnchor.constraint(equalToConstant: 120), // Adjust the width as needed

            // Separator constraints
            separatorView.topAnchor.constraint(equalTo: appLogoImageView.bottomAnchor, constant: -5),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
            
            ])
    }
    
    internal func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            // Adjust collectionView's top constraint to be below the separator
            collectionView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 65),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: RecipeCollectionViewCell.identifier)
        //create a block that register correct cell for user - subclassing not good tech - composition over sub class
    }
    
    // MARK: - UICollectionView DataSource and Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.identifier, for: indexPath)
        if let configureCell = configureCell {
            let item = items[indexPath.item]
            configureCell(cell, item)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Calculate the size of each item to fill the collection view without gaps
        let numberOfItemsPerRow: CGFloat = 2 // Or 2, based on your design
        let spacing: CGFloat = 0 // No spacing between items
        
        let totalSpacing = (numberOfItemsPerRow - 1) * spacing
        let itemWidth = (collectionView.bounds.width - totalSpacing) / numberOfItemsPerRow
        
        return CGSize(width: itemWidth, height: itemWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // No spacing between items horizontally
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0 // No spacing between items vertically
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let didSelectItem = didSelectItem {
            let item = items[indexPath.item]
            didSelectItem(item)
        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.size.width/2 - 10, height: view.frame.size.width/2)
//    }
}
