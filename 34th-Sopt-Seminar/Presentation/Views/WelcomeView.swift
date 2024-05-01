//
//  WelcomeView.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 4/26/24.
//

import UIKit
import SnapKit

final class WelcomeView: UIView {
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "rabbit")
        return imageView
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "???님\n반가워요!"
        label.textColor = .black
        label.font = .font(ofSize: 25, weight: .w800)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private var goHomeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .font(ofSize: 18, weight: .w700)
        button.layer.cornerRadius = 6
        return button
    }()
    
    lazy var backToLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
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

extension WelcomeView {
    
    private func setStyle() {
        backgroundColor = .white
    }
    
    private func setHierarchy() {
        [imageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            self.addSubview($0)
        }
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.size.equalTo(150)
            $0.top.equalTo(safeAreaLayoutGuide).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(58)
            $0.centerX.equalToSuperview()
        }
        
        goHomeButton.snp.makeConstraints {
            $0.height.equalTo(58)
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(71)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
        
        backToLoginButton.snp.makeConstraints {
            $0.height.equalTo(58)
            $0.top.equalTo(goHomeButton.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.centerX.equalToSuperview()
        }
    }
}
