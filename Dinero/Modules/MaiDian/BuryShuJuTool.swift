//
//  BuryShuJuTool.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/3.
//

import UIKit
import AdSupport

class BuryShuJuTool: NSObject {

    class func shujuLocationReportswks() {
        var params: [String: String] = [:]
        
        if let _c_c = DeviceAuthorizationTool.authorization().placeMark.isoCountryCode {
            params["salesworkers"] = _c_c
        }
        
        if let _c = DeviceAuthorizationTool.authorization().placeMark.country {
            params["personnel"] = _c
        }
        
        if let _l = DeviceAuthorizationTool.authorization().placeMark.locality {
            params["concentrations"] = _l;
        }
        
        if let _city = DeviceAuthorizationTool.authorization().placeMark.administrativeArea {
            params["hotels"] = _city
        }
        
        if let _stree = DeviceAuthorizationTool.authorization().placeMark.thoroughfare {
            params["administrative"] = _stree
        }
        
        if let _arw = DeviceAuthorizationTool.authorization().placeMark.subLocality {
            params["agriculture"] = _arw
        }
        
        if DeviceAuthorizationTool.authorization().locationAuthorization() == Limited ||
            DeviceAuthorizationTool.authorization().locationAuthorization() == Authorized {
            params["laundries"] = "\(DeviceAuthorizationTool.authorization().location.coordinate.latitude)"
            params["motels"] = "\(DeviceAuthorizationTool.authorization().location.coordinate.longitude)"
        }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/goldin", requestParams: params)) { _, _ in
            
        }
    }
    
    // IDFA/V
    class func IDFAAndIDFVReport() {
        let idfvsakw = UIDevice.current.readIDFVFormKeyChain()
        var p: [String: String] = ["exempted": idfvsakw]
        if DeviceAuthorizationTool.authorization().attTrackingStatus() == .authorized {
            p["amendment"] = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        } else {
            p["amendment"] = APP_DEFAULT_IDFA_MARK
        }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/pmc", requestParams: p)) { _, _ in
            
        }
    }
    
    // deviceInfo
    class func deviceInfoReport() {
        let m_model: DeviceMemoryModel = DeviceMemoryModel()
        let disk_cache = UIDevice.getAppDiskSize()
        m_model.implicit = disk_cache["availableCapacity"] as? String
        m_model.explicit = disk_cache["totalCapacity"] as? String
        m_model.received = "\(UIDevice.current.memoryTotal)"
        m_model.otherwise = UIDevice.getFreeMemory()
        
        APPCocoaLog.debug(" ----- 埋点内存 -------\n 总容量 = \(m_model.explicit ?? "") \n 可用容量 = \(m_model.implicit ?? "") \n 总内存 = \(m_model.received ?? "") \n 可用内存 = \(m_model.otherwise ?? "") \n")
        
        let dianChi: DeviceDianChiModel = DeviceDianChiModel()
        let e_arr = UIDevice.current.appBattery()
        dianChi.greg = e_arr.first
        dianChi.lakisha = e_arr.last
        
        APPCocoaLog.debug(" ----- 埋点电量 -------\n 电池电量 = \(dianChi.greg ?? "") \n 电池状态 = \(dianChi.lakisha ?? "") \n")
        
        let sys_model: DeviceSystemModel = DeviceSystemModel()
        sys_model.assigning = UIDevice.current.systemVersion
        sys_model.postings = UIDevice.current.machineModelName
        sys_model.landmark = UIDevice.current.machineModel
        
        APPCocoaLog.debug(" ----- 埋点版本 -------\n 系统版本 = \(sys_model.assigning ?? "") \n 设备名称 = \(sys_model.postings ?? "") \n 设备原始版本 = \(sys_model.landmark ?? "") \n")
        
        let time_m: DeviceSIMModel = DeviceSIMModel()
        time_m.yields = TimeZone.current.identifier
        time_m.measures = UIDevice.current.getSIMCardInfo()
        time_m.exempted = UIDevice.current.readIDFVFormKeyChain()
        time_m.replicated = UIDevice.current.getNetconnType()
        time_m.predictions = UIDevice.current.getIPAddress()
        if DeviceAuthorizationTool.authorization().attTrackingStatus() == .authorized {
            time_m.amendment = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        } else {
            time_m.amendment = APP_DEFAULT_IDFA_MARK
        }
        
        APPCocoaLog.debug(" ----- 埋点版本 -------\n 系统时区 = \(time_m.yields ?? "") \n 设备运营商 = \(time_m.measures ?? "") \n 设备IDFV = \(time_m.exempted ?? "") \n 设备网络类型 = \(time_m.replicated ?? "") \n 设备IDFA = \(time_m.amendment ?? "") 设备IP = \(time_m.predictions ?? "") \n")
        
        let wifi: DeviceWIFI = DeviceWIFI()
        let w_a = UIDevice.current.getWiFiInfo()
        wifi.rans = w_a.first
        wifi.acquiring = w_a.first
        wifi.single = w_a.last
        wifi.reliability = w_a.last
        
        APPCocoaLog.debug(" ----- 埋点设备WIFI -------\n SSID = \(wifi.rans ?? "") \n BSSID = \(wifi.single ?? "") \n")
        
        let wifi_m: DeviceWIFIModel = DeviceWIFIModel()
        wifi_m.dataset = wifi
        
        let info_m: BuryShuJuModel = BuryShuJuModel()
        info_m.articles = m_model
        info_m.emily = dianChi
        info_m.jamal = sys_model
        info_m.inconsistent = time_m
        info_m.predict = wifi_m
        
        guard let json = info_m.modelToJSONString() else { return }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/pmid", requestParams: ["unstats": json])) { _, _ in
            
        }
    }
    
    class func riskControlRepoeri(type: TongJiEventUploadStyle, beginTime: String? = nil, endTime: String? = nil, order_numb: String? = nil) {
        var pppp: [String: String] = ["dependence":type.rawValue]

        if let _id = GlobalCommonFile.shared.productID {
            pppp["institute"] = _id
        }
        
        if let _r = beginTime {
            pppp["preserves"] = _r
        }
        
        if let _e = endTime {
            pppp["cheap"] = _e
        }
        
        if let _ord = order_numb {
            pppp["little"] = _ord
        }
        
        if DeviceAuthorizationTool.authorization().locationAuthorization() == Limited ||
            DeviceAuthorizationTool.authorization().locationAuthorization() == Authorized {
            pppp["laundries"] = "\(DeviceAuthorizationTool.authorization().location.coordinate.latitude)"
            pppp["motels"] = "\(DeviceAuthorizationTool.authorization().location.coordinate.longitude)"
        }
    
        pppp["dominance"] = UIDevice.current.readIDFVFormKeyChain()
        
        APPCocoaLog.debug("数据上报参数 ==== ====== \(pppp) \n ==========")
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/claude", requestParams: pppp)) { _, _ in
            
        }
    }
}
