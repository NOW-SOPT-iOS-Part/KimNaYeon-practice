//
//  WelcomeViewController_DelegatePattern.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 3/30/24.
//

import UIKit
import SnapKit

protocol DataBindProtocol: AnyObject {
    func dataBind(id: String)
}

final class WelcomeViewController_DelegatePattern: UIViewController {
    typealias handler = ((String) -> (Void))
    
    private let rootView = WelcomeView()
    private lazy var backToLoginButton = rootView.backToLoginButton
    private lazy var welcomeLabel = rootView.welcomeLabel
    weak var delegate: DataBindProtocol?
//    var completionHandler: handler?
    var id: String?
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setButtonAction()
        bindID()
    }
}

extension WelcomeViewController_DelegatePattern {
    
    func setStyle() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setButtonAction() {
        backToLoginButton.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
    }
    
    private func bindID() {
//        guard let idText = id else { return }
//        welcomeLabel.text = "\(idText)님\n반가워요!"
        
        if let idText = id {
            welcomeLabel.text = "\(idText)님\n반가워요!"
        } else {
            print("id값이 없습니다.")
            /// UITextField text는 nil값이 넘어올 일이 없다! textField가 비어있어도 nil이 아닌 ""가 반환됨. objective-c와의 호환성을 위해 optional 타입으로 지정한 것이라고 함.
        }
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        if let id = id {
            delegate?.dataBind(id: id)
//            completionHandler?(id)
        }
        
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
