//
//  BasicTabbarViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit

class BasicTabbarViewController: UITabBarController {

    private var custom_bar: BasicTabbar?
    private var vc_array: [UIViewController.Type] = [FirstHoViewController.self, SecondOrdViewController.self, ThirdMineswlViewController.self]
    private var img_array: [[String]] = [["nor_home", "nor_order", "nor_mine"], ["sel_home", "sel_order", "sel_mine"]]
    private(set) var barHeight: CGFloat = jk_kTabbarFrameH + 10
    
    override var selectedIndex: Int {
        didSet {
            self.custom_bar?.selectedBarItem(selectedIndex)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildTabbarUI()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let _k_p = keyPath, let _new_value = change?[.newKey] as? Bool {
            if _k_p == LOGIN_OBERVER_KEY && !_new_value {
                self.selectedIndex = .zero
            }
        }
    }
}

private extension BasicTabbarViewController {
    func buildTabbarUI (){
        APPInfomationCache.saveApplicationInstallMark()
        self.custom_bar = BasicTabbar(frame: CGRect(origin: CGPointZero, size: CGSize(width: jk_kScreenW, height: barHeight)))
        self.setValue(self.custom_bar, forKey: "tabBar")
        self.custom_bar?.setTabBarImages(barImages: self.img_array)
        self.custom_bar?.barDelegate = self
        
        var listVC: [UIViewController] = []
        vc_array.forEach { (item: UIViewController.Type) in
            listVC.append(BasicNavigationViewController(rootViewController: item.init()))
        }
        
        self.viewControllers = listVC
        
        self.selectedIndex = .zero
        
        GlobalCommonFile.shared.addObserver(self, forKeyPath: LOGIN_OBERVER_KEY, options: [.new], context: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(userNeddRelogins), name: NSNotification.Name(APP_LOGIN_EXPIRED_NOTIFICATION), object: nil)
    }
}

extension BasicTabbarViewController: BasicTabbarProtocol {
    func canSelectedCurrentBarItem(shouldSelectedIndex: Int) -> Bool {
        guard let _vc_s = self.viewControllers, shouldSelectedIndex < _vc_s.count else {
            return false
        }
        
        guard let _nav = _vc_s[shouldSelectedIndex] as? BasicNavigationViewController else { return false }
    
        let _top_v = _nav.topViewController
        
        if (_top_v is SecondOrdViewController || _top_v is ThirdMineswlViewController) && GlobalCommonFile.shared.appLoginInfo?.got == nil {
            self.userNeddRelogins()
            return false
        }
        
        return true
    }
    
    func selectedCurrentBarItem(_ tabbr: BasicTabbar, item: UIButton, index: Int) {
        self.selectedIndex = index
    }
}

@objc private extension BasicTabbarViewController {
    func userNeddRelogins() {
        let logsjNac: BasicNavigationViewController = BasicNavigationViewController(rootViewController: LogiscskViewController())
        logsjNac.modalPresentationStyle = .overFullScreen
        self.present(logsjNac, animated: true)
    }
}
