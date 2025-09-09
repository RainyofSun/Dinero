//
//  CardAuthmwNsiwkeMode.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/9.
//

import UIKit
// MARK: - Root
class CardAuthmwNsiwkeMode: BasicResponseModel, YYModel {
    /// 手持
    var safeguards: Safeguards?
    
    /// 身份证正面
    var eliminating: Eliminating?
    
    /// 身份证反面
    var rescinding: Rescinding?
    
    var orders: String?
    
    var id_front_msg: String?
    var face_msg: String?
    
    /// 自拍
    var trump: Trump?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["safeguards": Safeguards.self, "eliminating": Eliminating.self, "rescinding": Rescinding.self, "trump": Trump.self]
    }
}

// MARK: - Safeguards
class Safeguards: BasicResponseModel {
    /// 状态为0表示未上传过
    var locations: Int?
}

// MARK: - Eliminating
class Eliminating: BasicResponseModel, YYModel {
    var locations: String?
    
    /// 【重要】图片url
    var claude: String?
    
    var initiatives: Initiatives?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["initiatives": Initiatives.self]
    }
}

// MARK: - Initiatives
class Initiatives: BasicResponseModel {
    var rans: String?
    var dei: String?
    var protections: String?
}

// MARK: - Rescinding
class Rescinding: BasicResponseModel {
    var locations: String?
    
    /// 【重要】图片url
    var claude: String?
}

// MARK: - Trump
class Trump: BasicResponseModel {
    var locations: String?
    
    /// 【重要】图片url
    var claude: String?
}
