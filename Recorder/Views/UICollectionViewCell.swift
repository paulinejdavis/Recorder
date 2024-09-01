//
//  UICollectionViewCell.swift
//  Recorder
//
//  Created by Pauline on 29/08/2024.
//

import Foundation
import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    static let identifier = "RecipeCollectionViewCell"

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

//    let titleLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 16)
//        label.textAlignment = .center
//        return label
//    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
//        contentView.addSubview(titleLabel)

        // Setup layout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            //imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),

//            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
//            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with recipe: Recipe) {
        imageView.image = recipe.image
       // titleLabel.text = recipe.title
    }
}

