//
//  ContactswhUserskwoAuthModels.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/11.
//

import UIKit
// MARK: - Root
class ContactswhUserskwoAuthModels: BasicResponseModel, YYModel {
    var statewide: [StatewideItem]?
    var memorization: [String]?   // 目前返回是空数组，先定义成 [String]?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["statewide": StatewideItem.self]
    }
}

// MARK: - StatewideItem
class StatewideItem: BasicResponseModel, YYModel {
    var harassed: String?      // 联系人关键键
    var rans: String?          // 联系人姓名
    var promotions: String?    // 联系人电话
    var gov: [Gov]?
    
    var gendered: String?      // 一级标题
    var denied: String?        // 二级关系标题
    var fired: String?         // 预留字文案
    var transgender: String?   // 二级手机号码和联系人标题
    var bisexual: String?      // 预留字文案
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["gov": Gov.self]
    }
}
