//
//  BasicViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit
import FDFullscreenPopGesture
@_exported import JKSwiftExtension

class BasicViewController: UIViewController {

    private(set) lazy var basicScrollContentView: UIScrollView = {
        let view = UIScrollView(frame: CGRectZero)
        view.contentInsetAdjustmentBehavior = .never
        return view
    }()
    
    private(set) lazy var gradientView: GradientColorView = {
        let view = GradientColorView()
        view.buildGradientWithColors(gradientColors: [Primary_Color1, Primary_Color2], gradientStyle: GradientDirectionStyle.topToBottom)
        view.isHidden = true
        return view
    }()
    
    open var buryingStartTime: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.buryingStartTime = Date().jk.dateToTimeStamp()
        
        self.fd_interactivePopDisabled = false
        self.fd_prefersNavigationBarHidden = false
        
        self.buildPageUI()
        self.layoutPageViews()
    }

    public func buildPageUI() {
        self.view.backgroundColor = UIColor.hexStringColor(hexString: "#FFF2EF")
        self.view.addSubview(self.gradientView)
        self.view.addSubview(self.basicScrollContentView)
    }
    
    public func layoutPageViews() {
        self.gradientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        if let _childrenVC = self.navigationController?.children, _childrenVC.count > 1 {
            self.basicScrollContentView.snp.makeConstraints { make in
                make.horizontalEdges.equalToSuperview()
                make.top.equalTo(self.view).offset(UIDevice.app_navigationBarAndStatusBarHeight() + LAYOUT_MIN_UNIT)
                make.bottom.equalToSuperview().offset(-UIDevice.app_safeDistanceBottom() - LAYOUT_MIN_UNIT)
            }
        } else {
            if self.presentingViewController != nil {
                self.basicScrollContentView.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
            } else {
                var bottom: Double = jk_kTabbarFrameH
                if let _tab = self.tabBarController as? BasicTabbarViewController {
                    bottom = _tab.barHeight
                }
                self.basicScrollContentView.snp.makeConstraints { make in
                    make.horizontalEdges.top.equalToSuperview()
                    make.bottom.equalToSuperview().offset(-bottom)
                }
            }
        }
    }
    
    public func refreshMineLocations() {
        DeviceAuthorizationTool.authorization().requestDeviceLocation()
    }
    
    public func pageNetRequest() {
        
    }
    
    public func changeTabBarBGColor(isClear: Bool) {
        if let _tab = self.tabBarController as? BasicTabbarViewController {
            _tab.changeBarColor(color: isClear ? UIColor.clear : UIColor.white)
        }
    }
}
