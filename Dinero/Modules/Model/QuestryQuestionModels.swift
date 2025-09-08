//
//  QuestryQuestionModels.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/8.
//

import UIKit

// MARK: - Root
class QuestryQuestionModels: BasicResponseModel, YYModel {
    var memorization: [Memorization]?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["memorization": Memorization.self]
    }
}

// MARK: - Memorization
class Memorization: BasicResponseModel, YYModel {
    var pmid: String?
    
    /// 【重要】标题
    var gendered: String?
    
    /// 【重要】预留字文案
    var weeks: String?
    
    /// 【重要】保存时传入的参数key，这个字段所对应的值会在调用保存接口时使用到，
    /// 这里的值需要当做保存接口的参数上传请求
    var tell: String?
    
    /// 【重要】自定义的认证项组件的值，参考接口文档左侧 7.值映射-认证项组件
    var ease: String?
    
    /// 【重要】当组件为文本输入框时：
    /// 如果值为1，则强制打开数字键盘 ，其他值则为默认字符键盘
    var vision: Int?
    
    /// 可选值
    var gov: [Gov]?
    
    var somewhat: Int?
    
    /// 认证状态
    var locations: Int?
    
    var durations: String?
    var acuteness: Bool?
    
    /// 【重要】返回的值
    var restricting: String?
    
    var hold: Int?
    
    var isExpand: Bool = false
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["gov": Gov.self]
    }
}

// MARK: - Gov
class Gov: BasicResponseModel {
    /// 客户端显示的值
    var rans: String?
    
    /// 提交到后端的字段对应值
    var lawrence: String?
}
