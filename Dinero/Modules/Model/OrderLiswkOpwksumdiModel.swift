//
//  OrderLiswkOpwksumdiModel.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/7.
//

import UIKit

// MARK: - Root
class OrderLiswkOpwksumdiModel: BasicResponseModel, YYModel {
    var transitions: [OrderTransition]?
    var agricultural: Int?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["transitions": OrderTransition.self]
    }
}

// MARK: - Transition
class OrderTransition: BasicResponseModel, YYModel {
    /// 订单id
    var living: String?
    
    var institute: String?
    var paul: Int?
    
    /// 【重要】 产品名称
    var pmc: String?
    
    /// 【重要】 产品logo
    var jhr: String?
    
    /// 订单状态
    var williams: String?
    
    var th: String?
    var audit: String?
    
    /// 【重要】 状态名称
    var lowell: String?
    
    /// 该笔订单的描述
    var emotional: String?
    
    /// 借款金额
    var dependable: String?
    
    /// 【重要】跳转地址
    var committed: String?
    
    var guidelines: String?
    
    /// 日期文案
    var judged: String?
    
    /// 额度文案
    var pregnant: String?
    
    /// 展期日期
    var belief: String?
    
    /// 逾期天数
    var historically: Int?
    
    /// 是否放款
    var percentile: Int?
    
    /// 借款时间
    var rd: String?
    
    /// 应还时间
    var lies: String?
    
    /// 借款期限
    var vary: String?
    
    /// 【重要】 订单列表显示数据 直接遍历下方数据就行，左右结构展示
    var annual: [Annual]?
    
    /// 【重要】借款协议 展示文案 为空不显示
    var exempt: String?
    
    var appear: String?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["annual" : Annual.self]
    }
}

// MARK: - Annual
class Annual: BasicResponseModel {
    /// 标题
    var gendered: String?
    
    /// 值
    var hourly: String?
}
