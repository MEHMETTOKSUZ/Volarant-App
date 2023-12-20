//
//  CollectionXibCell.swift
//  ValorantApp
//
//  Created by Mehmet ÖKSÜZ on 16.12.2023.
//

import UIKit

class CollectionXibCell: UICollectionViewCell {
    
    struct ViewModel {
        let uuid: String
        let description: String
        let displayName: String
        let fullPortrait: String?
        let backgroundGradientColors: [String]
        let role: String
        let agentAbilities: [Ability]
        
        var abilitiesDisplayName: String {
            agentAbilities.map { $0.displayName}.joined(separator: ", ")
        }
        
        var abilities: String {
            agentAbilities.map { $0.description }.joined(separator: ", ")
        }
        
        var displayIcon: String {
            agentAbilities.compactMap { $0.displayIcon }.joined(separator: ", ")
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fullportraitImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    
    func itemFromCell(item: ViewModel) {
        self.nameLabel.text = item.displayName
        self.abilitiesLabel.text = item.role
        if let image = item.fullPortrait {
            self.fullportraitImage.downloaded(from: image)
        }
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.backgroundImage.bounds

        let gradientColors = item.backgroundGradientColors.map { UIColor(hexString: $0)?.cgColor }
        gradientLayer.colors = gradientColors as [Any]

        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)

        self.backgroundImage.layer.cornerRadius = 40
        self.backgroundImage.layer.insertSublayer(gradientLayer, at: 0)
       

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension CollectionXibCell.ViewModel {
    init(response: Datum) {
        
        self.init(uuid: response.uuid,
                  description: response.description,
                  displayName: response.displayName,
                  fullPortrait: response.fullPortrait,
                  backgroundGradientColors: response.backgroundGradientColors,
                  role: response.role?.displayName.rawValue ?? "",
                  agentAbilities: response.abilities
        )
        
    }
}
