//
//  NutritionInfoCell.swift
//  testTaskk
//
//  Created by Edgar Sargsyan on 17.06.24.
//

import UIKit

class NutritionInfoCell: UITableViewCell {
    static let identifier = "NutritionInfoCell"

    private let labels: [UILabel] = {
        return ["45 белки", "20 жиры", "33 углеводы","450 ккал"].map {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            label.textAlignment = .center
            label.text = $0
            return label
        }
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        for label in labels {
            contentView.addSubview(label)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let labelWidth = contentView.frame.size.width / CGFloat(labels.count)
        for (index, label) in labels.enumerated() {
            label.frame = CGRect(x: CGFloat(index) * labelWidth, y: 0, width: labelWidth, height: contentView.frame.size.height)
        }
    }

    func configure(with nutritionInfo: [String]) {
        for (index, info) in nutritionInfo.enumerated() {
            labels[index].text = info
        }
    }
}
