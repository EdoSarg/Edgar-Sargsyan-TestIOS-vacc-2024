//
//  IngredientCell.swift
//  testTaskk
//
//  Created by Edgar Sargsyan on 17.06.24.
//

import UIKit

class IngredientCell: UITableViewCell {
    static let identifier = "IngredientCell"
    
    private let ingredientLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(ingredientLabel)
        
        ingredientLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            ingredientLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            ingredientLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            ingredientLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            ingredientLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with ingredient: String) {
        ingredientLabel.text = ingredient
    }
}
