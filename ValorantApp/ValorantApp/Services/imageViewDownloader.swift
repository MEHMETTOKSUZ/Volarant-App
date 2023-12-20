//
//  imageViewDownloader.swift
//  ValorantApp
//
//  Created by Mehmet ÖKSÜZ on 5.12.2023.
//

import Foundation
import UIKit
import Kingfisher


 extension UIImageView {
    func downloaded(from url: String?, contentMode mode: ContentMode = .scaleAspectFit, completion: ((Bool) -> Void)? = nil) {
        contentMode = mode
        guard let realPath = url else {
            return
        }
        
        let fileURL = URL(string: realPath)
        
        guard let downloadURL = fileURL else {
            return
        }
        
        let resource = KF.ImageResource(downloadURL: downloadURL, cacheKey: realPath)
        
        self.kf.indicatorType = .activity
        (kf.indicator?.view as? UIActivityIndicatorView)?.color = .white
        
        var options: KingfisherOptionsInfo = []
        
        options = [.transition(ImageTransition.fade(0.3)), .forceTransition]
        
        
        self.kf.setImage(with: resource,
                         options: options,
                         completionHandler:  { (result) in
                            
                            switch result {
                            case .success:
                                completion?(true)
                            case .failure:
                                completion?(false)
                            }
                         })

    }
}

extension UIColor {
    convenience init?(hexString: String) {
        var hexSanitized = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            return nil
        }

        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}


