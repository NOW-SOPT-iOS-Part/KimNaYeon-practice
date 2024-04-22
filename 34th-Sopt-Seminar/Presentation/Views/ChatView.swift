//
//  ChatView.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 4/20/24.
//

import UIKit
import SnapKit

final class ChatView: UIView {

    let tableView = UITableView(frame: .zero, style: .plain)
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatView {
    
    private func setLayout() {
        backgroundColor = .white
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
