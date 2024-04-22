//
//  ItemViewController.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 4/20/24.
//

import UIKit
import SnapKit

final class ItemViewController: UIViewController {
    
    // MARK: - Properties
    
    final let carrotLineSpacing: CGFloat = 10
    final let carrotInterItemSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let carrotInset = UIEdgeInsets(top: 48, left: 20, bottom: 10, right: 20)
    private var itemList = ItemModel.dummy()
    
    // MARK: - UI Components
    
    private let itemView = ItemView()
    private lazy var collectionView = itemView.collectionView

    // MARK: - Life Cycles
    
    override func loadView() {
        super.loadView()
        
        view = itemView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        register()
    }
}

private extension ItemViewController {
    
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func register() {
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.identifier)
    }
}

extension ItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }
        cell.delegate = self
        cell.dataBind(itemList[indexPath.item], itemRow: indexPath.item)
        return cell
    }
}

extension ItemViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - carrotInset.left - carrotInset.right - carrotInterItemSpacing
        return CGSize(width: doubleCellWidth / 2, height: 198)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return carrotLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return carrotInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return carrotInset
    }
}

extension ItemViewController: ItemCollectionViewCellDelegate {
    func likeButtonDidTap(state: Bool, row: Int) {
        itemList[row].likeIsSelected = state
    }
}
