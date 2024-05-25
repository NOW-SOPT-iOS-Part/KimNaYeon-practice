//
//  ChatTableViewCell.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 4/20/24.
//

import UIKit
import SnapKit

final class ChatTableViewCell: UITableViewCell {
    static let identifier = "ChatTableViewCell"
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .person
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "나연이"
        label.textColor = .black
        label.font = .font(ofSize: 15, weight: .w700)
        return label
    }()
    
    private let placeLabel: UILabel = {
        let label = UILabel()
        label.text = "수유동"
        label.textColor = UIColor(red: 156/256, green: 156/256, blue: 156/256, alpha: 1)
        label.font = .font(ofSize: 12, weight: .w400)
        return label
    }()
    
    private let chatLabel: UILabel = {
        let label = UILabel()
        label.text = "달달한 거 먹고싶어"
        label.textColor = .black
        label.font = .font(ofSize: 14, weight: .w400)
        return label
    }()
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    
    // MARK: - Life Cycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChatTableViewCell {
    
    private func setLayout() {
        [profileImageView, nameLabel, placeLabel, chatLabel, itemImageView].forEach {
            contentView.addSubview($0)
        }
        
        profileImageView.snp.makeConstraints {
            $0.size.equalTo(40)
            $0.leading.verticalEdges.equalToSuperview().inset(16)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16.5)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
        }
        
        placeLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.trailing).offset(4)
            $0.centerY.equalTo(nameLabel)
        }
        
        chatLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.bottom.equalToSuperview().inset(16.5)
        }
        
        itemImageView.snp.makeConstraints {
            $0.size.equalTo(40)
            $0.trailing.verticalEdges.equalToSuperview().inset(16)
        }
    }
    
    func dataBind(_ chatData: ChatModel) {
        profileImageView.image = chatData.profileImg
        nameLabel.text = chatData.name
        placeLabel.text = chatData.place
        chatLabel.text = chatData.message
        itemImageView.image = chatData.itemImg
    }
}
