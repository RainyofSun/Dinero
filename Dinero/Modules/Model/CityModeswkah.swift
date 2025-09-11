//
//  CityModeswkah.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/11.
//

import UIKit

// MARK: - Province
class CityModeswkah: BasicResponseModel, YYModel {
    var released: String?          // 省
    var ucla: [City]?              // 市
    
    static func modelContainerPropertyGenericClass() -> [String : Any]? {
        return ["ucla": City.self]
    }
    
    class func saveCirmapsjSownTosDisak(_ jsonSt: String) {
        FileManager.default.createFile(atPath: GlobalCommonFile.shared.ciprosjdkCityPath, contents: jsonSt.data(using: String.Encoding.utf8))
    }
    
    class func readCistForsmwDiwska() -> [CityModeswkah] {
        if !FileManager.default.fileExists(atPath: GlobalCommonFile.shared.ciprosjdkCityPath) {
            return []
        }
        
        do {
            let das = try Data(contentsOf: NSURL(fileURLWithPath: GlobalCommonFile.shared.ciprosjdkCityPath) as URL)
            return (NSArray.modelArray(with: CityModeswkah.self, json: das) as? [CityModeswkah]) ?? []
        } catch {
            
        }
        
        return []
    }
}

// MARK: - City
class City: BasicResponseModel {
    var rans: String?              // 市名称
}
