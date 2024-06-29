//
//  IngredientRemovalCell.swift
//  testTaskk
//
//  Created by Edgar Sargsyan on 28.06.24.
//

import UIKit

class IngredientRemovalCell: UITableViewCell {
    static let identifier = "IngredientRemovalCell"
    
    private let titleLabel = UILabel()
    private let switchControl = UISwitch()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(switchControl)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            switchControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            switchControl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        switchControl.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
    }

    var switchChangedHandler: ((String, Bool) -> Void)?
    private var ingredient: String = ""

    func configure(with ingredient: String, switchChangedHandler: @escaping (String, Bool) -> Void) {
        self.ingredient = ingredient
        titleLabel.text = ingredient
        self.switchChangedHandler = switchChangedHandler
    }

    @objc private func switchChanged() {
        switchChangedHandler?(ingredient, switchControl.isOn)
    }
}
