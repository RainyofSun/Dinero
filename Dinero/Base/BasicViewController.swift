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
    
    open var buryingStartTime: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.buryingStartTime = Date().jk.dateToTimeStamp()
        
        self.fd_interactivePopDisabled = false
        self.fd_prefersNavigationBarHidden = false
        
        self.buildPageUI()
        self.layoutPageViews()
        
        self.pageNetRequest()
    }

    public func buildPageUI() {
        self.view.addSubview(self.basicScrollContentView)
    }
    
    public func layoutPageViews() {
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
                self.basicScrollContentView.snp.makeConstraints { make in
                    make.horizontalEdges.top.equalToSuperview()
                    make.bottom.equalToSuperview().offset(-UIDevice.app_tabbarAndSafeAreaHeight())
                }
            }
        }
    }
    
    public func refreshMineLocations() {
        DeviceAuthorizationTool.authorization().requestDeviceLocation()
    }
    
    public func pageNetRequest() {
        
    }
}
