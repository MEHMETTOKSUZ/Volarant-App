//
//  WebService.swift
//  ValorantApp
//
//  Created by Mehmet ÖKSÜZ on 2.12.2023.
//

import Foundation

class WebService {
    
    static let shared = WebService()
    private init() {}
    
    func fetchMediaData<T: Codable>(from url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                let results = try JSONDecoder().decode(T.self, from: data)
                completion(.success(results))
            } catch let error {
                print("API Error: ", error.localizedDescription)
                completion(.failure(error))
            }
        }.resume()
    }
}












