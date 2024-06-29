//
//  PizzaImageCell.swift
//  testTaskk
//
//  Created by Edgar Sargsyan on 17.06.24.
//

import UIKit

class PizzaImageCell: UITableViewCell {
    static let identifier = "PizzaImageCell"

    private let pizzaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(pizzaImageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        pizzaImageView.frame = contentView.bounds
    }

    func configure(with image: UIImage?) {
        pizzaImageView.image = image
    }
}


