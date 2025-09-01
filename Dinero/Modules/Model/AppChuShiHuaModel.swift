//
//  AppChuShiHuaModel.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit

class AppChuShiHuaModel: BasicResponseModel, YYModel {
    var indicators: Int = -1
    // 隐私协议
    var sdg: String?
    // Facebook
    var original: FacebookData?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["original": FacebookData.self]
    }
}

class FacebookData: BasicResponseModel {
    // CFBundleURLScheme
    var archived: String?
    // FacebookAppID
    var cfo: String?
    // FacebookDisplayName
    var remedy: String?
    // FacebookClientToke
    var max: String?
}
