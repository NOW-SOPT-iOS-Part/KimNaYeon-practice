//
//  ItemCollectionViewCell.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 4/20/24.
//

import UIKit
import SnapKit

protocol ItemCollectionViewCellDelegate: AnyObject {
    func likeButtonDidTap(state: Bool, row: Int)
}

final class ItemCollectionViewCell: UICollectionViewCell {
    static let identifier = "ItemCollectionViewCell"
    
    weak var delegate: ItemCollectionViewCellDelegate?
    private var itemRow: Int?
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 4
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .font(ofSize: 16, weight: .w400)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 255/255, green: 126/255, blue: 54/255, alpha: 1)
        label.font = .font(ofSize: 15, weight: .w700)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = UIColor(red: 235/255, green: 8/255, blue: 8/255, alpha: 1)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        button.addTarget(self, action: #selector(likeButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        likeButton.isSelected = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ItemCollectionViewCell {
    
    private func setLayout() {
        [itemImageView, nameLabel, priceLabel, likeButton].forEach {
            contentView.addSubview($0)
        }
        
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(9)
            $0.bottom.equalToSuperview().inset(59)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(3)
            $0.horizontalEdges.equalTo(itemImageView.snp.horizontalEdges).offset(4)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.horizontalEdges.equalTo(nameLabel)
            $0.bottom.equalToSuperview().inset(18)
        }
        
        likeButton.snp.makeConstraints {
            $0.size.equalTo(16)
            $0.trailing.equalTo(itemImageView.snp.trailing).offset(-8)
            $0.bottom.equalTo(itemImageView.snp.bottom).offset(-8)
        }
    }
    
    func dataBind(_ itemData: ItemModel, itemRow: Int) {
        itemImageView.image = itemData.itemImg
        nameLabel.text = itemData.name
        priceLabel.text = itemData.price
        likeButton.isSelected = itemData.likeIsSelected
        self.itemRow = itemRow
    }
    
    @objc
    private func likeButtonDidTap() {
        likeButton.isSelected.toggle()
        if let itemRow {
            self.delegate?.likeButtonDidTap(state: self.likeButton.isSelected, row: itemRow)
        }
    }
}
