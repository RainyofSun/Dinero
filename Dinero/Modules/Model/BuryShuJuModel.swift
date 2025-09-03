//
//  BuryShuJuModel.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/3.
//

import UIKit

class BuryShuJuModel: BasicResponseModel, YYModel {
    // 内存
    var articles: DeviceMemoryModel?
    // 电量
    var emily: DeviceDianChiModel?
    // 系统
    var jamal: DeviceSystemModel?
    // sim
    var inconsistent: DeviceSIMModel?
    // wifi
    var predict: DeviceWIFIModel?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["articles": DeviceMemoryModel.self, "emily": DeviceDianChiModel.self, "jamal": DeviceSystemModel.self,
                "inconsistent": DeviceSIMModel.self, "predict": DeviceWIFIModel.self]
    }
}

class DeviceMemoryModel: BasicResponseModel {
    // 可用存储
    var implicit: String?
    // 总存储
    var explicit: String?
    // 总内存
    var received: String?
    // 内存可用
    var otherwise: String?
}

class DeviceDianChiModel: BasicResponseModel {
    // 剩余电量
    var greg: String?
    // 是否在充电
    var lakisha: String?
}

class DeviceSystemModel: BasicResponseModel {
    // 系统版本
    var assigning: String?
    // 设备名牌
    var postings: String?
    // 原始型号
    var landmark: String?
}

class DeviceSIMModel: BasicResponseModel {
    // 时区
    var yields: String?
    // 运营商
    var measures: String?
    // idfv
    var exempted: String?
    // 网络类型
    var replicated: String?
    // 内网 IP
    var predictions: String?
    // idfa
    var amendment: String?
}

class DeviceWIFIModel: BasicResponseModel, YYModel {
    var dataset: DeviceWIFI?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["dataset": DeviceWIFI.self]
    }
}

class DeviceWIFI: BasicResponseModel {
    // mac 地址
    var single: String?
    var reliability: String?
    // wifi
    var rans: String?
    var acquiring: String?
}
