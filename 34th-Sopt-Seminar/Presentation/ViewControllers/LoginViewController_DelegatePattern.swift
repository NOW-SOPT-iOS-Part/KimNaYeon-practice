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
    private lazy var passwordTextField = rootView.passwordTextField
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
        guard let id = idTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        let request = LoginRequestModel(
            authenticationId: id,
            password: password
        )
        
        UserService.shared.login(request: request) { [weak self] response in
            switch response {
            case .success(let data):
                guard let data = data as? LoginResponseModel else { return }
                dump(data)
                print("ㅇㅇ")
                self?.pushToWelcomeVC()
            case .requestErr:
                print("요청 오류 입니다")
            case .decodedErr:
                print("디코딩 오류 입니다")
            case .pathErr:
                print("경로 오류 입니다")
            case .serverErr:
                print("서버 오류입니다")
            case .networkFail:
                print("네트워크 오류입니다")
            }
        }
    }
}

extension LoginViewController_DelegatePattern: DataBindProtocol {
    func dataBind(id: String) {
        idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
    }
}
