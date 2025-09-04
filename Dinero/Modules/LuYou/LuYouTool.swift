//
//  LuYouTool.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/4.
//

import UIKit

class LuYouTool: NSObject {
    public static let  shared = LuYouTool()
    
    private var webhandlerMethods: [String] = [CloseWebPage, PageTransitionNoParams, PageTransitionWithParams, CloseAndGotoHome, CloseAndGotoLoginPage, CloseAndGotoMineCenter, GotoAppStore, ConfirmApplyBury]
    
    public func gotoPage(pageUrl url: String, backtoRoot root: Bool = false, targetVcslao: UIViewController? = nil) {
        guard let _root_vc = UIDevice.current.keyWindow().rootViewController as? BasicTabbarViewController else {
            return
        }
        
        let top_saw = _root_vc.jk.topViewController()
        
        if url.hasPrefix("http") {
            top_saw?.navigationController?.pushViewController(WebCskielViewController(withWebLinkURL: APPPublicParams.request().splicingPublicParams(url), backToRoot: root, webFuncScriptHandler: webhandlerMethods), animated: true)
        } else {
            if url.contains(APP_SETTING) {
                top_saw?.navigationController?.pushViewController(SettingkowlsViewController(), animated: true)
            } else if url.contains(APP_HOME) {
                top_saw?.navigationController?.popToRootViewController(animated: true)
                _root_vc.selectedIndex = .zero
            } else if url.contains(APP_LOGIN) {
                let logsjNac: BasicNavigationViewController = BasicNavigationViewController(rootViewController: LogiscskViewController())
                logsjNac.modalPresentationStyle = .overFullScreen
                top_saw?.present(logsjNac, animated: true)
                top_saw?.navigationController?.popToRootViewController(animated: false)
            } else if url.contains(APP_ORDER) {
                top_saw?.navigationController?.popToRootViewController(animated: false)
                _root_vc.selectedIndex = 1
            } else if url.contains(APP_PRODUCT) {
                top_saw?.navigationController?.pushViewController(ChanPinProdViewController(withCommodityIDNumber: self.pseparationURLParameter(url: url)), animated: true)
            } else {
                if let _t = targetVcslao {
                    top_saw?.navigationController?.pushViewController(_t, animated: true)
                }
            }
        }
    }
}

private extension LuYouTool {
    func pseparationURLParameter(url: String) -> String {
        let paraStr = url.components(separatedBy: "?").last
        let paraStr1 = paraStr?.components(separatedBy: "=").last
        return paraStr1 ?? ""
    }
}
