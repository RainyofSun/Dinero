//
//  HomeChanPinModel.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/5.
//

import UIKit

// MARK: - Root
class HomeChanPinModel: BasicResponseModel, YYModel {
    public var customer: String = ""
    public var isRepay: Int = 0
    public var isReyNoticeMsg: String = ""
    public var maria: Maria?
    public var realStatus: Int = 0
    public var scrollMsg: [String]?
    public var sdg: String?
    public var transitions: [Transition]?
    
    // 大卡
    var bigCardData: Katz?
    // 小卡
    var smallCardData: Katz?
    // 产品列表
    var cardDatas: [Katz]?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["maria": Maria.self, "transitions": Transition.self]
    }
    
    func filterHomeModelsiwk() {
        guard let _trans = self.transitions else {
            return
        }
        
        for item in _trans {
            if let _type = item.lawrence {
                if _type == ShouYeElement.BigpwjsuCard.rawValue {
                    self.bigCardData = item.katz?.first
                }
                
                if _type == ShouYeElement.SmallalsowCard.rawValue {
                    self.smallCardData = item.katz?.first
                }
                
                if _type == ShouYeElement.ProductskkList.rawValue {
                    self.cardDatas = item.katz
                }
            }
        }
    }
}

// MARK: - Maria
class Maria: BasicResponseModel {
    public var aer: String?
    public var cycles: String?
    public var elite: String?
    public var karamessini: String?
}

// MARK: - Transition
class Transition: BasicResponseModel, YYModel {
    public var katz: [Katz]?
    public var lawrence: String?
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["katz": Katz.self]
    }
}

// MARK: - Katz
class Katz: BasicResponseModel {
    public var amelia: String?
    public var catherine: String?
    public var dan: String?
    public var haviland: String?
    public var jhr: String?
    public var lowell: String?
    public var pmc: String?
    public var pmid: String?
    public var relations: String?
    public var sanders: String?
    public var seth: String?
    public var taylor: String?
    public var termInfo1: String?
    public var termInfo2: String?
    public var yxTag: [String]?
    var mary: String?
}
