//
//  CollectionViewCell.swift
//  testTaskk
//
//  Created by Edgar Sargsyan on 12.06.24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    let titleLbl = UILabel()
    let descriptionLbl = UILabel()
    let priceLbl = UILabel()
    let discountLbl = UILabel()
    let addButton = UIButton()
    var complition: ((Int) -> ())?
    
    var index = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    func setupViews() {
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150)
        ])

        
        titleLbl.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLbl.numberOfLines = 2
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLbl)

        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])

        
        descriptionLbl.font = UIFont.systemFont(ofSize: 12, weight: .light)
        descriptionLbl.numberOfLines = 1
        descriptionLbl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLbl)

        NSLayoutConstraint.activate([
            descriptionLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 5),
            descriptionLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])

        
        priceLbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        priceLbl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(priceLbl)

        NSLayoutConstraint.activate([
            priceLbl.topAnchor.constraint(equalTo: descriptionLbl.bottomAnchor, constant: 4),
            priceLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])

        
        discountLbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        discountLbl.textColor = .red
        discountLbl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(discountLbl)

        NSLayoutConstraint.activate([
            discountLbl.topAnchor.constraint(equalTo: priceLbl.bottomAnchor, constant: 4),
            discountLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])

        
        addButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        addButton.tintColor = .red
        addButton.transform = CGAffineTransform(scaleX: 3, y: 3)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        contentView.addSubview(addButton)

     
        NSLayoutConstraint.activate([
            
            addButton.topAnchor.constraint(equalTo: discountLbl.bottomAnchor, constant: -10),
            
            
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            addButton.widthAnchor.constraint(equalToConstant: 15),
            addButton.heightAnchor.constraint(equalToConstant: 15)
        ])
    }

    @objc func buttonTapped() {
        complition?(index)
    }
}

