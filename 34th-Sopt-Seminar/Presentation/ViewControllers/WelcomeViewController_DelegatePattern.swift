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

class WelcomeViewController_DelegatePattern: UIViewController {
    typealias handler = ((String) -> (Void))
    
    weak var delegate: DataBindProtocol?
    var completionHandler: handler?
    var id: String?
        
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "rabbit")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "???님\n반가워요!"
        label.textColor = .black
        label.font = .font(.pretendard_extraBold, ofSize: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private var goHomeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .font(.pretendard_bold, ofSize: 18)
        button.layer.cornerRadius = 6
        return button
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = .font(.pretendard_bold, ofSize: 18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()
        bindID()
    }
    
    private func setStyle() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        [imageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.size.equalTo(150)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
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
}

