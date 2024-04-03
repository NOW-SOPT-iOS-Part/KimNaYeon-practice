//
//  FontLiterals.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 4/3/24.
//

import Foundation
import UIKit

enum FontType: String {
    case pretendard_bold = "Pretendard-Bold"
    case pretendard_extraBold = "Pretendard-ExtraBold"
    case pretendard_semiBold = "Pretendard-SemiBold"
    case pretendard_light = "Pretendard-Light"
    case pretendard_extraLight = "Pretendard-ExtraLight"
    case pretendard_thin = "Pretendard-Thin"
    case pretendard_regular = "Pretendard-Regular"
    case pretendard_medium = "Pretendard-Medium"
}

extension UIFont {
    
    static func font(_ fontType: FontType, ofSize size: CGFloat) -> UIFont {
        guard let font = UIFont(name: fontType.rawValue, size: size)
        else { return UIFont.systemFont(ofSize: size) }
        return font
    }
}
