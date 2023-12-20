//
//  DetailsViewController.swift
//  ValorantApp
//
//  Created by Mehmet ÖKSÜZ on 19.12.2023.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: DetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "DetailsCell", bundle: nil)
        self.collectionView.register(nibName, forCellWithReuseIdentifier: "DetailsCell")
        
        let viewNibName = UINib(nibName: "DetailsHeaderView", bundle: nil)
        self.collectionView.register(viewNibName, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "DetailsHeaderView")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
}

extension DetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCell", for: indexPath) as! DetailsCell
        
        let item = viewModel.item(at: indexPath.item)
        cell.configure(item: item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "DetailsHeaderView", for: indexPath) as! DetailsHeaderView
        
        view.configure(item: viewModel.UIModel)
        
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let indexPath = IndexPath(row: 0, section: section)
        
        let headerView = self.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader, at: indexPath)
        
        return headerView.systemLayoutSizeFitting(CGSize(width: collectionView.frame.width - 32, height: UIView.layoutFittingExpandedSize.height),
                                                  withHorizontalFittingPriority: .required,
                                                  verticalFittingPriority: .fittingSizeLevel)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let headerView = self.collectionView(collectionView, cellForItemAt: indexPath)
        
        return headerView.systemLayoutSizeFitting(CGSize(width: collectionView.frame.width - 32, height: UIView.layoutFittingExpandedSize.height),
                                                  withHorizontalFittingPriority: .required,
                                                  verticalFittingPriority: .fittingSizeLevel)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
}
