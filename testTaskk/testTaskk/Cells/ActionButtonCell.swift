//
//  ActionButtonCell.swift
//  testTaskk
//
//  Created by Edgar Sargsyan on 17.06.24.
//

import UIKit

class ActionButtonCell: UITableViewCell {
    static let identifier = "ActionButtonCell"
    
    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Добавить за 690₽", for: .normal)
        button.backgroundColor = UIColor.red 
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        contentView.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            actionButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            actionButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            actionButton.widthAnchor.constraint(equalToConstant: 343),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    func configure(with title: String) {
        actionButton.setTitle(title, for: .normal)
    }
}



