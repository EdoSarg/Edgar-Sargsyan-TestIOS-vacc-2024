//
//  SizeAndCrustSelectionCell.swift
//  testTaskk
//
//  Created by Edgar Sargsyan on 17.06.24.
//

import UIKit

class SizeAndCrustSelectionCell: UITableViewCell {
    static let identifier = "SizeAndCrustSelectionCell"

    private let sizeSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Маленькая", "Средняя", "Большая"])
        control.selectedSegmentIndex = 1
        return control
    }()

    private let crustSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Традиционное тесто", "Тонкое тесто"])
        control.selectedSegmentIndex = 0
        return control
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(sizeSegmentedControl)
        contentView.addSubview(crustSegmentedControl)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        sizeSegmentedControl.frame = CGRect(x: 10, y: 5, width: contentView.frame.size.width - 20, height: 30)
        crustSegmentedControl.frame = CGRect(x: 10, y: 40, width: contentView.frame.size.width - 20, height: 30)
    }
}
