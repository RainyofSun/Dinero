//
//  ChanPineInfoModelsow.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/8.
//

import UIKit

// MARK: - Root
class ChanPineInfoModelsow: BasicResponseModel, YYModel {
    var looks: Int?
    
    /// 产品信息
    var analyze: Analyze?
    
    /// 认证项  列表认证项顺序按照此字段值显示  后端可能会更改顺序
    var opposed: [Opposed]?
    
    /// 【重要】下一个待完成的认证项
    var responded: Responded?
    
    /// 【重要】 借款协议
    var aarp: Aarp?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["analyze": Analyze.self, "opposed": Opposed.self]
    }
}

// MARK: - Analyze
class Analyze: BasicResponseModel, YYModel {
    /// 额度范围
    var composition: [Int]?
    
    /// 金额 【重要】
    var francine: String?
    
    /// 借款期限
    var house: [String]?
    
    /// 借款金额文案
    var migration: String?
    
    /// 借款期限文案
    var controls: String?
    
    /// 产品id 【重要】
    var pmid: String?
    
    /// 产品名称 【重要】
    var pmc: String?
    
    /// 产品LOGO【重要】
    var jhr: String?
    
    /// 订单号 风控埋点接口会用到【重要】
    var little: String?
    
    /// 订单id
    var living: Int?
    
    /// 遍历下方的数据，会包含期数 利率 或者金额【重要】
    var pooled: Pooled?
    
    /// 底部按钮文案 【重要】
    var lowell: String?
    
    var guidelines: String?
    var vary: String?
    var offenses: Int?
    var claude: String?
    var convicted: Convicted?
    var criminal: String?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["pooled": Pooled.self, "convicted": Convicted.self]
    }
}

// MARK: - Pooled
class Pooled: BasicResponseModel, YYModel {
    var unlawful: ProxyItem?
    var record: ProxyItem?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["unlawful": ProxyItem.self, "recoed": ProxyItem.self]
    }
}

// MARK: - ProxyItem
class ProxyItem: BasicResponseModel {
    var gendered: String?
    var proxy: String?
}

// MARK: - Convicted
class Convicted: BasicResponseModel {
    var restricting: String?
}

// MARK: - Opposed
class Opposed: BasicResponseModel {
    /// 标题 【重要】
    var gendered: String?
    
    /// 预留字文案 【重要】
    var weeks: String?
    
    var lawrence: Int?
    var claude: String?
    
    /// 是否已完成  【重要】
    var locations: Int?
    
    var durations: String?
    
    /// 类型 【重要】用作判断, 混淆后参考值映射  根据该字段判断跳转对应页面
    var aged: String?
    
    var percentage: Int?
    var somewhat: Int?
    var curve: Int?
    var ahead: String?
    
    /// icon 【重要】
    var staying: String?
}

// MARK: - Responded
class Responded: BasicResponseModel {
    /// 【重要】如果点击 "未认证" 的认证项，则跳转到 "这个字段下发的下一步" 的认证详情页，
    /// 如果点击 "已完成" 的认证项，则打开点击当前的认证详情页。
    /// 为空串代表全部认证项已完成
    var aged: String?
    
    var claude: String?
    var lawrence: Int?
    var gendered: String?
}

// MARK: - Aarp
class Aarp: BasicResponseModel {
    /// 【重要】展示文案  为空不显示
    var gendered: String?
    
    /// 【重要】跳转地址
    var speed: String?
}
