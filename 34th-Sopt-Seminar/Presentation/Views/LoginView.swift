//
//  LoginView.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 4/20/24.
//

import UIKit
import SnapKit

final class LoginView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.font = .font(ofSize: 18, weight: .w700)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.font = .font(ofSize: 14, weight: .w600)
        textField.textColor = .black
        textField.setPlaceholderColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1))
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.setLeftPadding(amount: 23)
        textField.setRightPadding(amount: 23)
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.font = .font(ofSize: 14, weight: .w600)
        textField.textColor = .black
        textField.setPlaceholderColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1))
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        textField.layer.cornerRadius = 3
        textField.setLeftPadding(amount: 23)
        textField.setRightPadding(amount: 23)
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .font(ofSize: 18, weight: .w700)
        button.layer.cornerRadius = 6
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("SecondView Error!")
    }
}

extension LoginView {
    
    private func setStyle() {
        backgroundColor = .white
    }
    
    private func setHierarchy() {
        [titleLabel, stackView, loginButton].forEach {
            self.addSubview($0)
        }
        [idTextField, passwordTextField].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(114)
            $0.centerX.equalToSuperview()
        }
        
        idTextField.snp.makeConstraints {
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(52)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(71)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        loginButton.snp.makeConstraints {
            $0.height.equalTo(58)
            $0.top.equalTo(stackView.snp.bottom).offset(35)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}
