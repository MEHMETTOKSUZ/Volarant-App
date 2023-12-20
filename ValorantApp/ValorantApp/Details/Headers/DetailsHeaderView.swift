//
//  DetailsHeaderView.swift
//  ValorantApp
//
//  Created by Mehmet ÖKSÜZ on 19.12.2023.
//

import UIKit

class DetailsHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var agentImageView: UIImageView!
    @IBOutlet weak var abilityLabel: UILabel!
    @IBOutlet weak var abilityDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(item: DetailsUIModel) {
        
        if let image = item.headerImageUrl {
            agentImageView.downloaded(from: image)
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.backgroundImageView.bounds
        
         let gradientColors = item.headerGradientColors
            let colors: [Any] = gradientColors.compactMap { UIColor(hexString: $0)?.cgColor }
            gradientLayer.colors = colors
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        self.backgroundImageView.layer.cornerRadius = 25
        
        self.backgroundImageView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        self.backgroundImageView.layer.insertSublayer(gradientLayer, at: 0)
        
        nameLabel.text = item.headerTitleText
        abilityLabel.text = item.headerFooterText
        abilityDescriptionLabel.text = item.descriptionText
        
    }
}
