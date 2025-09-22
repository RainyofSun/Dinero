//
//  StartFlashViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit
import FBSDKCoreKit
import CYSwiftExtension

protocol FlashProtocol: AnyObject {
    func didMissFlashViews()
}

class StartFlashViewController: BasicViewController {

    weak open var sDelegate: FlashProtocol?
    
    private lazy var contentImgView = UIImageView(image: UIImage(named: "startFass"))
    private lazy var tryBtn = UIButton.buildGradientLoadingButton(APPLanguageInsTool.loadLanguage("start_try"))
    private lazy var firstCell = FlashCellView(frame: CGRectZero)
    private lazy var secondCell = FlashCellView(frame: CGRectZero, isFirst: false)
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        self.pageNetRequest()
    }
    
    override func buildPageUI() {
        super.buildPageUI()
        
        self.tryBtn.isHidden = true
        self.tryBtn.corner(16)
        
        self.view.addSubview(self.contentImgView)
        self.view.addSubview(self.tryBtn)
        
        self.basicScrollContentView.isPagingEnabled = true
        self.basicScrollContentView.isHidden = true
        self.basicScrollContentView.isScrollEnabled = false
        
        self.basicScrollContentView.addSubview(self.firstCell)
        self.basicScrollContentView.addSubview(self.secondCell)
        
        self.tryBtn.addTarget(self, action: #selector(letusTryAgain(sender: )), for: UIControl.Event.touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(wangluoBianChange(sender: )), name: NSNotification.Name(APPLICATION_NET_CHANGE), object: nil)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.basicScrollContentView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.contentImgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.tryBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.height.equalTo(50)
            make.horizontalEdges.equalToSuperview().inset(50)
        }
        
        self.firstCell.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.size.equalTo(self.view.size)
        }
        
        self.secondCell.snp.makeConstraints { make in
            make.left.equalTo(self.firstCell.snp.right)
            make.top.size.equalTo(self.firstCell)
            make.right.equalToSuperview()
        }
    }
    
    override func pageNetRequest() {
        if UIDevice.jk.isIpad() {
            let _model: AppChuShiHuaModel = AppChuShiHuaModel()
            _model.indicators = 1
            
            GlobalCommonFile.shared.countryCode = _model.indicators
            APPPublicParams.request().appUpdateLoginToken(nil, withContryCode: "\(_model.indicators)")
            // 设置多语言
            APPLanguageInsTool.setLocalLanguage(InterbationalLanguage.init(rawValue: _model.indicators) ?? InterbationalLanguage.English)
            
            if APPInfomationCache.applicationFirstInstall() {
                self.basicScrollContentView.isHidden = false
                self.contentImgView.isHidden = true
                self.tryBtn.isHidden = false
                self.tryBtn.setTitle(APPLanguageInsTool.loadLanguage("auth_btn"), for: UIControl.State.normal)
                self.firstCell.refreshText(true)
                self.secondCell.refreshText(false)
            } else {
                self.sDelegate?.didMissFlashViews()
            }
            
            return
        }
        
        // 使用代理
        let useProcy = UIDevice.getProxyStatus("https://baidu.com") ? "1" : "0"
        let appYuYan: String = UIDevice.jk.appLanguage
        let useVPN = UIDevice.isVPNEnabled() ? "1" : "0"
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/associations", requestParams: ["olof": useProcy, "associations": appYuYan, "rooth": useVPN])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _dict = res.jsonDict, let _model = AppChuShiHuaModel.model(with: _dict) else {
                return
            }
            
            GlobalCommonFile.shared.isAppInitializationSuccess = true
            GlobalCommonFile.shared.privacyURL = _model.sdg
            
            if _model.indicators != -1 {
                GlobalCommonFile.shared.countryCode = _model.indicators
                APPPublicParams.request().appUpdateLoginToken(nil, withContryCode: "\(_model.indicators)")
                // 设置多语言
                APPLanguageInsTool.setLocalLanguage(InterbationalLanguage.init(rawValue: _model.indicators) ?? InterbationalLanguage.English)
            }
            
            if _model.indicators == 2 && DeviceAuthorizationTool.authorization().locationAuthorization() != Authorized && DeviceAuthorizationTool.authorization().locationAuthorization() != Limited {
                GlobalCommonFile.shared.showPositionAlert = true
            }
            
            #if DEBUG
            #else
            if let _fa = _model.original {
                self?.FacebookChuShiHua(_fa)
            }
            #endif
            
            if APPInfomationCache.applicationFirstInstall() {
                self?.basicScrollContentView.isHidden = false
                self?.contentImgView.isHidden = true
                self?.tryBtn.isHidden = false
                self?.tryBtn.setTitle(APPLanguageInsTool.loadLanguage("auth_btn"), for: UIControl.State.normal)
                self?.firstCell.refreshText(true)
                self?.secondCell.refreshText(false)
            } else {
                self?.sDelegate?.didMissFlashViews()
            }
        } failure: {[weak self] task, error in
            self?.tryBtn.isHidden = false
            self?.mutableNetURLRequest()
        }
    }
    
    @objc func letusTryAgain(sender: APPActivityButton) {
        if self.basicScrollContentView.isHidden {
            APPNetRequestURLConfig.clearDomainURLCache()
            self.pageNetRequest()
        } else {
            if self.basicScrollContentView.contentOffset == .zero {
                self.basicScrollContentView.setContentOffset(CGPoint(x: jk_kScreenW, y: 0), animated: true)
                self.tryBtn.setTitle(APPLanguageInsTool.loadLanguage("guide_com"), for: UIControl.State.normal)
            } else {
                self.sDelegate?.didMissFlashViews()
            }
        }
    }
    
    @objc func wangluoBianChange(sender: NSNotification) {
        if let _net_state = sender.object as? DeviceNetObserver.NetworkStatus, _net_state != .NetworkStatus_NoNet, APPInfomationCache.applicationFirstInstall() {
            // 第一次安装时，等到网络授权之后，再重新请求初始化
            self.pageNetRequest()
            // 关闭网络探测
            DeviceNetObserver.shared.StopNetworkObserverListener()
            NotificationCenter.default.removeObserver(self)
        }
    }
}

private extension StartFlashViewController {
    func FacebookChuShiHua(_ fbModel: FacebookData) {
        Settings.shared.appID = fbModel.cfo
        Settings.shared.displayName = fbModel.remedy
        Settings.shared.clientToken = fbModel.max
        Settings.shared.appURLSchemeSuffix = fbModel.archived
        Settings.shared.isAutoLogAppEventsEnabled = true
        ApplicationDelegate.shared.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
    }
    
    func mutableNetURLRequest() {
        let config: NetworkRequestConfig = NetworkRequestConfig.defaultRequestConfig(ke_bian_service_address + ke_bina_service_domain, requestParams: nil)
        config.requestType = .download
        APPNetRequestManager.afnReqeustType(config) { [weak self] (task :URLSessionDataTask, res: APPSuccessResponse) in
            guard let _str = res.responseMsg, let _do_models = NSArray.modelArray(with: MutableNetURLModel.self, json: _str) as? [MutableNetURLModel] else {
                return
            }
            
            for item in _do_models {
                if let _url = item.cp, APPNetRequestURLConfig.reloadNetworkRequestDomainURL(_url) {
                    APPNetRequestConfig.reloadNetworkRequestURL()
                    self?.pageNetRequest()
                    break
                }
            }
        }
    }
}
