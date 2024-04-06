//
//  ScrollViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 4/6/24.
//

import UIKit
import SnapKit

final class ScrollViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private let purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setHierarchy() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            self.contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.width.equalTo(scrollView.snp.width)
            $0.edges.equalTo(scrollView.contentLayoutGuide)
        }
        
        redView.snp.makeConstraints {
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(337)
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        orangeView.snp.makeConstraints {
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(337)
            $0.top.equalToSuperview()
            $0.leading.equalTo(redView.snp.trailing)
            $0.trailing.equalToSuperview()
        }
        
        yellowView.snp.makeConstraints {
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(337)
            $0.top.equalTo(redView.snp.bottom)
            $0.leading.equalToSuperview()
        }
        
        greenView.snp.makeConstraints {
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(337)
            $0.top.equalTo(orangeView.snp.bottom)
            $0.leading.equalTo(yellowView.snp.trailing)
            $0.trailing.equalToSuperview()
        }
        
        blueView.snp.makeConstraints {
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(337)
            $0.top.equalTo(yellowView.snp.bottom)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(142)
        }
        
        purpleView.snp.makeConstraints {
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(337)
            $0.top.equalTo(greenView.snp.bottom)
            $0.leading.equalTo(blueView.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(blueView.snp.bottom)
        }
    }
}

#Preview {
    ScrollViewController()
}
