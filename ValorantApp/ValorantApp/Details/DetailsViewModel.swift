//
//  DetailsViewModel.swift
//  ValorantApp
//
//  Created by Mehmet ÖKSÜZ on 19.12.2023.
//

import Foundation

struct DetailsUIModel {
    
    let headerGradientColors: [String]
    let headerImageUrl: String?
    let headerTitleText: String
    let headerFooterText: String
    let descriptionText: String
    let items: [Item]
    
    struct Item {
        
        let iconUrl: String?
        let titleText: String
        let description: String
        
    }
}

class DetailsViewModel {
    
    let UIModel: DetailsUIModel
    
    init(selectedAgent: CollectionXibCell.ViewModel) {
        self.UIModel = DetailsUIModel(detailItem: selectedAgent)
    }
    
    var numberOfItemsInSection: Int {
        return UIModel.items.count
    }
    
    func item(at indexPath: Int) -> DetailsUIModel.Item {
        return UIModel.items[indexPath]
    }
}

extension DetailsUIModel {
    init(detailItem: CollectionXibCell.ViewModel) {
        
        let items = detailItem.agentAbilities.map { item in
            DetailsUIModel.Item(iconUrl: item.displayIcon, titleText: item.displayName, description: item.description)
        }
        
        self.init(headerGradientColors: detailItem.backgroundGradientColors,
                  headerImageUrl: detailItem.fullPortrait,
                  headerTitleText: detailItem.displayName,
                  headerFooterText: detailItem.role,
                  descriptionText: detailItem.description,
                  items: items
        )
    }
}





