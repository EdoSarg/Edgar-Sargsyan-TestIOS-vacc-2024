//
//  RecycleTableViewCell.swift
//  testTaskk
//
//  Created by Edgar Sargsyan on 29.06.24.
//

import UIKit

class RecycleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureUI(model: RecycleModel) {
        titleLabel.text = model.title
        priceLabel.text = model.price
    }
}
