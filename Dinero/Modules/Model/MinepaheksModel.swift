//
//  MinepaheksModel.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/6.
//

import Foundation

// MARK: - Root
class MinepaheksModel: BasicResponseModel, YYModel {
    var transitions: [MineTransition]?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["transitions": MineTransition.self]
    }
}

// MARK: - Transition
class MineTransition: BasicResponseModel {
    /// 标题
    var gendered: String?
    
    /// 跳转地址 【重要】 返回的是 http 开头的，就跳转内置浏览器 webview。
    /// 如果返回的不是 http 开头的，而是自定义 scheme，就跳转对应的原生页面。
    var claude: String?
    
    /// 图标
    var maria: String?
}
