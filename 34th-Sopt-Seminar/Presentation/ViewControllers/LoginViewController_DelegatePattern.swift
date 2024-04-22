//
//  LoginViewController_DelegatePattern.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 3/30/24.
//

import UIKit
import SnapKit

final class LoginViewController_DelegatePattern: UIViewController {
    
    private let rootView = LoginView()
    private lazy var idTextField = rootView.idTextField
    private lazy var loginButton = rootView.loginButton
    
    override func loadView() {
        super.loadView()
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonAction()
    }
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController_DelegatePattern()
        welcomeVC.modalPresentationStyle = .formSheet
        welcomeVC.id = idTextField.text
        self.present(welcomeVC, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeVC = WelcomeViewController_DelegatePattern()
        welcomeVC.delegate = self
//        welcomeVC.completionHandler = { [weak self] id in
//            guard let self else { return }
//            self.idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
//        }
        welcomeVC.id = idTextField.text
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
}

extension LoginViewController_DelegatePattern {
    
    func setButtonAction() {
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func loginButtonDidTap() {
//        presentToWelcomeVC()
        pushToWelcomeVC()
    }
}

extension LoginViewController_DelegatePattern: DataBindProtocol {
    func dataBind(id: String) {
        idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
    }
}
