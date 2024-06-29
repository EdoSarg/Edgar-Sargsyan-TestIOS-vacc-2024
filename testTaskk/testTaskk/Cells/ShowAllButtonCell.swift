//
//  ShowAllButtonCell.swift
//  testTaskk
//
//  Created by Edgar Sargsyan on 28.06.24.
//

import UIKit

class ShowAllButtonCell: UITableViewCell {
    static let identifier = "ShowAllButtonCell"
    
    private let button = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray5
        button.setTitleColor(.red, for: .normal)
        button.layer.cornerRadius = 8
        contentView.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 343),
            button.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configure(with title: String, action: Selector, target: Any) {
        button.setTitle(title, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
    }
}
