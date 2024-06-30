//
//  ItemModel.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 4/22/24.
//

import Foundation
import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var likeIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .iceGreenTeaLatte, name: "아이스녹차라떼", price: "4,500원", likeIsSelected: false),
            ItemModel(itemImg: .macbook, name: "아이폰 12", price: "1,000,000원", likeIsSelected: false),
            ItemModel(itemImg: .animalCrossing, name: "닌텐도 동물의숲 칩", price: "20,000원", likeIsSelected: false),
            ItemModel(itemImg: .rabbit, name: "민음사 세계문학전집", price: "500,000원", likeIsSelected: false),
            ItemModel(itemImg: .rabbit, name: "그림 그려드립니다", price: "1,000원", likeIsSelected: false),
            ItemModel(itemImg: .macbook, name: "매직 트랙패드", price: "80,000원", likeIsSelected: false),
            ItemModel(itemImg: .iceGreenTeaLatte, name: "조말론 우드 세이지 앤 씨솔트", price: "100,000원", likeIsSelected: false),
            ItemModel(itemImg: .iceGreenTeaLatte, name: "그린티라떼", price: "30,000원", likeIsSelected: false),
            ItemModel(itemImg: .macbook, name: "맥북 M1 Pro 512GB", price: "3,000,000원", likeIsSelected: false),
            ItemModel(itemImg: .rabbit, name: "나의 배고픔", price: "5,000원", likeIsSelected: false),
            ItemModel(itemImg: .rabbit, name: "나의 배고픔", price: "5,000원", likeIsSelected: false),
            ItemModel(itemImg: .rabbit, name: "나의 배고픔", price: "5,000원", likeIsSelected: false),
        ]
    }
}

