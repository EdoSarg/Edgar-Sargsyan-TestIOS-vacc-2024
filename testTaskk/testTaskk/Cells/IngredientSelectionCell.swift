//
//  IngredientSelectionCell.swift
//  testTaskk
//
//  Created by Edgar Sargsyan on 17.06.24.
//
import UIKit

class IngredientTableViewCell: UITableViewCell {
    static let identifier = "IngredientTableViewCell"

    
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // Метка веса
      private let weightLabel: UILabel = {
          let label = UILabel()
          label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
          label.textAlignment = .center
          label.textColor = .blue  
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()
    
    private func createVerticalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }

    private func createImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

    private func createLabel(fontSize: CGFloat, textAlignment: NSTextAlignment = .center) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        label.textAlignment = textAlignment
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    private func createButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    private let ingredientImageView1 = UIImageView()
    private let nameLabel1 = UILabel()
    private let priceLabel1 = UILabel()
    private let minusButton1 = UIButton(type: .system)
    private let quantityLabel1 = UILabel()
    private let plusButton1 = UIButton(type: .system)

    private let ingredientImageView2 = UIImageView()
    private let nameLabel2 = UILabel()
    private let priceLabel2 = UILabel()
    private let minusButton2 = UIButton(type: .system)
    private let quantityLabel2 = UILabel()
    private let plusButton2 = UIButton(type: .system)

    private let ingredientImageView3 = UIImageView()
    private let nameLabel3 = UILabel()
    private let priceLabel3 = UILabel()
    private let minusButton3 = UIButton(type: .system)
    private let quantityLabel3 = UILabel()
    private let plusButton3 = UIButton(type: .system)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(horizontalStackView)
        
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])

        addIngredientSection(ingredientImageView: ingredientImageView1, nameLabel: nameLabel1, priceLabel: priceLabel1, minusButton: minusButton1, quantityLabel: quantityLabel1, plusButton: plusButton1)
        addIngredientSection(ingredientImageView: ingredientImageView2, nameLabel: nameLabel2, priceLabel: priceLabel2, minusButton: minusButton2, quantityLabel: quantityLabel2, plusButton: plusButton2)
        addIngredientSection(ingredientImageView: ingredientImageView3, nameLabel: nameLabel3, priceLabel: priceLabel3, minusButton: minusButton3, quantityLabel: quantityLabel3, plusButton: plusButton3)
    }

    private func addIngredientSection(ingredientImageView: UIImageView, nameLabel: UILabel, priceLabel: UILabel, minusButton: UIButton, quantityLabel: UILabel, plusButton: UIButton) {
        let verticalStackView = createVerticalStackView()
        horizontalStackView.addArrangedSubview(verticalStackView)

        minusButton.setTitle("-", for: .normal)
        quantityLabel.text = "1"
        plusButton.setTitle("+", for: .normal)

        let quantityStackView = UIStackView()
        quantityStackView.axis = .horizontal
        quantityStackView.alignment = .center
        quantityStackView.spacing = 5
        quantityStackView.translatesAutoresizingMaskIntoConstraints = false

        quantityStackView.addArrangedSubview(minusButton)
        quantityStackView.addArrangedSubview(quantityLabel)
        quantityStackView.addArrangedSubview(plusButton)

        priceLabel.textColor = .red
        verticalStackView.addArrangedSubview(ingredientImageView)
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(priceLabel)

        verticalStackView.addArrangedSubview(quantityStackView)

        NSLayoutConstraint.activate([
            ingredientImageView.widthAnchor.constraint(equalToConstant: 80),
            ingredientImageView.heightAnchor.constraint(equalToConstant: 80),
            minusButton.widthAnchor.constraint(equalToConstant: 30),
            minusButton.heightAnchor.constraint(equalToConstant: 30),
            quantityLabel.widthAnchor.constraint(equalToConstant: 30),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    func configure(with ingredients: [(String, UIImage?)]) {
        if ingredients.count > 0 {
            configureIngredientSection(imageView: ingredientImageView1, nameLabel: nameLabel1, priceLabel: priceLabel1, minusButton: minusButton1, quantityLabel: quantityLabel1, plusButton: plusButton1, ingredient: ingredients[0])
        }
        if ingredients.count > 1 {
            configureIngredientSection(imageView: ingredientImageView2, nameLabel: nameLabel2, priceLabel: priceLabel2, minusButton: minusButton2, quantityLabel: quantityLabel2, plusButton: plusButton2, ingredient: ingredients[1])
        }
        if ingredients.count > 2 {
            configureIngredientSection(imageView: ingredientImageView3, nameLabel: nameLabel3, priceLabel: priceLabel3, minusButton: minusButton3, quantityLabel: quantityLabel3, plusButton: plusButton3, ingredient: ingredients[2])
        }
    }

    private func configureIngredientSection(imageView: UIImageView, nameLabel: UILabel, priceLabel: UILabel, minusButton: UIButton, quantityLabel: UILabel, plusButton: UIButton, ingredient: (String, UIImage?)) {
        imageView.image = ingredient.1
        nameLabel.text = ingredient.0
        priceLabel.text = "159₽"
        quantityLabel.text = "1"
        quantityLabel.text = "1"
    }
}


class ViewController: UIViewController, UITableViewDataSource {

    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(IngredientTableViewCell.self, forCellReuseIdentifier: IngredientTableViewCell.identifier)
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
   


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IngredientTableViewCell.identifier, for: indexPath) as? IngredientTableViewCell else {
            return UITableViewCell()
        }
        
        
        cell.configure(with: [("Сырный бортик", UIImage(named: "cheese_border")), ("Томатный соус", UIImage(named: "tomato_sauce")), ("Ветчина", UIImage(named: "ham"))])

        return cell
    }
}
