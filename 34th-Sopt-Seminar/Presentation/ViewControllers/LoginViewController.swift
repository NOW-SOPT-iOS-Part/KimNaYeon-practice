//
//  LoginViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 3/30/24.
//

import UIKit

class LoginViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.font = .font(.pretendard_bold, ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView(frame: CGRect(x: 20, y: 276, width: 335, height: 52*2+7))
        stackView.axis = .vertical
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.font = .font(.pretendard_semiBold, ofSize: 14)
        textField.textColor = .black
        textField.setPlaceholderColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1))
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.setLeftPadding(amount: 23)
        textField.setRightPadding(amount: 23)
        return textField
    }()

    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.font = .font(.pretendard_semiBold, ofSize: 14)
        textField.textColor = .black
        textField.setPlaceholderColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1))
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.setLeftPadding(amount: 23)
        textField.setRightPadding(amount: 23)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .font(.pretendard_bold, ofSize: 18)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
    }
    
    private func setLayout() {
        self.view.backgroundColor = .white
        
        [titleLabel, stackView, loginButton].forEach {
            self.view.addSubview($0)
        }
        
        [idTextField, passwordTextField].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    @objc
    private func loginButtonDidTap() {
//        presentToWelcomeVC()
        pushToWelcomeVC()
    }
    
    private func presentToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.modalPresentationStyle = .formSheet
        welcomeVC.id = idTextField.text
        self.present(welcomeVC, animated: true)
    }
    
    private func pushToWelcomeVC() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.id = idTextField.text
        self.navigationController?.pushViewController(welcomeVC, animated: true)
    }
}
