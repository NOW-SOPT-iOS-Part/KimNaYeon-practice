//
//  ChatModel.swift
//  34th-Sopt-Seminar
//
//  Created by 김나연 on 4/20/24.
//

import Foundation
import UIKit

struct ChatModel {
    let profileImg: UIImage
    let name: String
    let place: String
    let message: String
    let itemImg: UIImage
}

extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel(profileImg: ImageLiterals.Item.rabbit, name: "류희재", place: "성북구", message: "땡큐", itemImg: ImageLiterals.Item.rabbit),
            ChatModel(profileImg: ImageLiterals.Item.rabbit, name: "윤희슬", place: "여의도", message: "안녕", itemImg: ImageLiterals.Item.rabbit),
            ChatModel(profileImg: ImageLiterals.Item.rabbit, name: "김가현", place: "잠실", message: "아요", itemImg: ImageLiterals.Item.rabbit),
            ChatModel(profileImg: ImageLiterals.Item.rabbit, name: "김선우", place: "회기", message: "너무 좋아요", itemImg: ImageLiterals.Item.rabbit),
            ChatModel(profileImg: ImageLiterals.Item.rabbit, name: "김나연", place: "미국", message: "뿅", itemImg: ImageLiterals.Item.rabbit),
            ChatModel(profileImg: ImageLiterals.Item.rabbit, name: "김민서", place: "중국", message: "뿡", itemImg: ImageLiterals.Item.rabbit),
            ChatModel(profileImg: ImageLiterals.Item.rabbit, name: "김수연", place: "일본", message: "자기야 미안해 했자나", itemImg: ImageLiterals.Item.rabbit),
            ChatModel(profileImg: ImageLiterals.Item.rabbit, name: "한지석", place: "태국", message: "솝트 이딴거 안했어", itemImg: ImageLiterals.Item.rabbit),
            ChatModel(profileImg: ImageLiterals.Item.rabbit, name: "한정원", place: "명왕성", message: "진짜?", itemImg: ImageLiterals.Item.rabbit),
            ChatModel(profileImg: ImageLiterals.Item.rabbit, name: "이지훈", place: "안드로메다", message: "난이서~", itemImg: ImageLiterals.Item.rabbit)
        ]
    }
}
