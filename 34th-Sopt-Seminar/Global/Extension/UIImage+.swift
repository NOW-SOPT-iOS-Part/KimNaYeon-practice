//
//  UIImage+.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 4/22/24.
//

import UIKit

extension UIImage {
    
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
}
