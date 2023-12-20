//
//  ViewModel.swift
//  ValorantApp
//
//  Created by Mehmet ÖKSÜZ on 2.12.2023.
//

import Foundation

class HomeViewModel {
    
    var didFinishLoad: (() -> Void)?
    var didFinishLoadWithError: ((String) -> Void)?
    var volarantData: [CollectionXibCell.ViewModel] = []
    
    var numberOfInSection: Int {
        return volarantData.count
    }
    
    func item(at index: Int) -> CollectionXibCell.ViewModel {
        return volarantData[index]
    }
    
    func getResponce() {
        
        guard let url = URL(string: "https://valorant-api.com/v1/agents?language=tr-TR") else {
            print("Invalid URL")
            return
            
        }
        
        WebService.shared.fetchMediaData(from: url) { (result: Result<DatumResponse, Error>) in
            switch result {
            case .success(let data):
               self.converResult(result: data.data)
            case .failure(let error):
                self.didFinishLoadWithError?(error.localizedDescription)
            }
        }
    }
    
    func converResult(result: [Datum]) {
        
        let viewModel: [CollectionXibCell.ViewModel] = result.map { results in
            CollectionXibCell.ViewModel(response: results)
        }
        
        self.volarantData = viewModel
        self.didFinishLoad?()
    }
}
