//
//  UITextField+.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 4/3/24.
//

import UIKit

extension UITextField {
    
    func setLeftPadding(amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPadding(amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func setPlaceholderColor(_ placeholderColor: UIColor) {
        attributedPlaceholder = NSAttributedString(
            string: placeholder ?? "",
            attributes: [ .foregroundColor: placeholderColor,
                          .font: UIFont.font(.pretendard_semiBold, ofSize: 14)
            ].compactMapValues { $0 }
        )
    }
}
