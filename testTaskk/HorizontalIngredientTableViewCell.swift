//
//  HorizontalIngredientTableViewCell.swift
//  testTaskk
//
//  Created by Edgar Sargsyan on 20.06.24.
//

import UIKit

class HorizontalIngredientTableViewCell: UITableViewCell {
    static let identifier = "HorizontalIngredientTableViewCell"
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with ingredients: [(String, UIImage?)]) {
        for ingredient in ingredients {
            let ingredientView = createIngredientView(name: ingredient.0, image: ingredient.1)
            contentStackView.addArrangedSubview(ingredientView)
        }
    }
    
    private func createIngredientView(name: String, image: UIImage?) -> UIView {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = image
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 8
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let nameLabel: UILabel = {
            let label = UILabel()
            label.text = name
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let priceLabel: UILabel = {
            let label = UILabel()
            label.text = "159₽"
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let minusButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("-", for: .normal)
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.systemGray.cgColor
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        let plusButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("+", for: .normal)
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.systemGray.cgColor
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        let quantityLabel: UILabel = {
            let label = UILabel()
            label.text = "1"
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        containerView.addSubview(imageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(minusButton)
        containerView.addSubview(quantityLabel)
        containerView.addSubview(plusButton)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            priceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            minusButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            minusButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            minusButton.widthAnchor.constraint(equalToConstant: 30),
            minusButton.heightAnchor.constraint(equalToConstant: 30),
            
            quantityLabel.centerYAnchor.constraint(equalTo: minusButton.centerYAnchor),
            quantityLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 5),
            quantityLabel.widthAnchor.constraint(equalToConstant: 30),
            
            plusButton.centerYAnchor.constraint(equalTo: minusButton.centerYAnchor),
            plusButton.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 5),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.heightAnchor.constraint(equalToConstant: 30),
            plusButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5)
        ])
        
        containerView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        return containerView
    }
}
