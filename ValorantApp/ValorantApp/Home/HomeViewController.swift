//
//  ViewController.swift
//  ValorantApp
//
//  Created by Mehmet ÖKSÜZ on 2.12.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "CollectionXibCell", bundle: nil)
        self.collectionView.register(nibName, forCellWithReuseIdentifier: "Cell")
        
        let viewNibName = UINib(nibName: "HomeHeaderView", bundle: nil)
        self.collectionView.register(viewNibName, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeHeaderView")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
       viewModel.didFinishLoad = {
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            
            viewModel.didFinishLoadWithError = { error in
                print("Error: \(error)")
            }

            viewModel.getResponce()
 
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,  UIScrollViewDelegate , UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionXibCell {
            
            let item = viewModel.item(at: indexPath.row)
            cell.itemFromCell(item: item)
           
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let selectedAgent = viewModel.item(at: indexPath.row)
            performSegue(withIdentifier: "toDetailsFromAgentVC", sender: selectedAgent)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
              let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
        
        if identifier == "toDetailsFromAgentVC" {
            let data = viewModel.item(at: indexPath.row)
            let viewmodel = DetailsViewModel(selectedAgent: data)
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.viewModel = viewmodel
             
            }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.bounds.width
        let cellSize = width / 2 - 15
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeHeaderView", for: indexPath)
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 250)
    }
}

