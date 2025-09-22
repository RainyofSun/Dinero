//
//  WebCskielViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/4.
//

import UIKit
import StoreKit

class WebCskielViewController: APPWebController {

    private var b_b_time: String = ""
    
    override func hookMethodUI() {
        super.hookMethodUI()
        
        self.fd_interactivePopDisabled = true
        self.fd_prefersNavigationBarHidden = true
        
        DeviceAuthorizationTool.authorization().requestDeviceLocation()
        self.view.backgroundColor = .white
        self.setProcessBarTrackColor(Primary_Color1, tintColor: Primary_Color2)
    }
    
    override func shouldPop() -> Bool {
        return self.webControllerCanPop()
    }
    
    override func hookMethodWebFuncCallback(_ funcName: String, funcParams: [String]) {
        super.hookMethodWebFuncCallback(funcName, funcParams: funcParams)
        
        APPCocoaLog.debug("接受到JS传递的消息：\(funcName) body = \(funcParams)")
        
        if funcName == CloseWebPage {
            let _ = self.shouldPop()
        }
        
        if funcName == PageTransitionNoParams || funcName == PageTransitionWithParams || funcName == CloseAndGotoMineCenter {
            LuYouTool.shared.gotoPage(pageUrl: funcParams.first ?? "", backtoRoot: true)
        }
        
        if funcName == CloseAndGotoHome {
            LuYouTool.shared.gotoPage(pageUrl: APP_HOME)
        }
        
        if funcName == CloseAndGotoLoginPage {
            LuYouTool.shared.gotoPage(pageUrl: APP_LOGIN)
        }
        
        if funcName == GotoAppStore {
            if #available(iOS 14.0, *) {
                if let scene = UIApplication.shared.currentScene {
                    SKStoreReviewController.requestReview(in: scene)
                }
            } else {
                SKStoreReviewController.requestReview()
            }
        }
        
        if funcName == ConfirmApplyBury {
            DeviceAuthorizationTool.authorization().requestDeviceLocation()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: {
                self.b_b_time = Date().jk.dateToTimeStamp()
                BuryShuJuTool.riskControlRepoeri(type: TongJiEventUploadStyle.TJ_EndAppply, beginTime: self.b_b_time, endTime: Date().jk.dateToTimeStamp(), order_numb: GlobalCommonFile.shared.productOrderNum)
            })
        }
    }
}

extension UIApplication {
    var currentScene: UIWindowScene? {
        connectedScenes.first { $0.activationState == .foregroundActive } as? UIWindowScene
    }
}
