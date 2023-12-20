//
//  DetailsCell.swift
//  ValorantApp
//
//  Created by Mehmet ÖKSÜZ on 19.12.2023.
//

import UIKit

class DetailsCell: UICollectionViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(item: DetailsUIModel.Item) {
        
        self.descriptionLabel.text = item.description
        self.titleLabel.text = item.titleText
        if let image = item.iconUrl {
            self.imageView.downloaded(from: image)
        }
    }
}
