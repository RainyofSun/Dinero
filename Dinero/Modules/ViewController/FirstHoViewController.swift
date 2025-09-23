//
//  FirstHoViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit

class FirstHoViewController: BasicViewController, AutoHiddenNavigationBar {

    private lazy var bigCard: BigCardViskdl = BigCardViskdl(frame: CGRectZero)
    private lazy var smallCard: SmallCardViskaowk = SmallCardViskaowk(frame: CGRectZero)
    
    private var _locan_sk_modls: Katz?
    private var _service_smd_mods: Maria?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.pageNetRequest()
    }
    
    override func buildPageUI() {
        NotificationCenter.default.addObserver(self, selector: #selector(refreshHowmswl), name: NSNotification.Name.init("refreshHome"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(wangsluwoMeiswk(sender: )), name: NSNotification.Name(APPLICATION_NET_CHANGE), object: nil)
        super.buildPageUI()
        
        self.basicScrollContentView.isHidden = true
        self.bigCard.bihdelegate = self
        self.smallCard.samllDelesjek = self
        self.basicScrollContentView.addSubview(self.bigCard)
        self.view.addSubview(self.smallCard)
        self.changeTabBarBGColor(isClear: true)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.basicScrollContentView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.bigCard.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.size.equalTo(CGSize(width: jk_kScreenW, height: self.bigCard.image?.size.height ?? jk_kScreenH))
            make.bottom.equalToSuperview()
        }
        
        self.smallCard.snp.makeConstraints { make in
            make.top.width.equalTo(self.basicScrollContentView)
            make.left.equalTo(self.basicScrollContentView.snp.right)
            make.bottom.equalToSuperview().offset(-(jk_kTabbarFrameH + 10))
        }
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        self.refreshMineLocations()
        BuryShuJuTool.shujuLocationReportswks()
        BuryShuJuTool.deviceInfoReport()
        if DeviceAuthorizationTool.authorization().attTrackingStatus() == .authorized {
            BuryShuJuTool.IDFAAndIDFVReport()
        }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/sdg", requestParams: [:])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _di = res.jsonDict, let _model = HomeChanPinModel.model(with: _di) else {
                return
            }
            
            _model.filterHomeModelsiwk()
            
            if let _bid_data = _model.bigCardData {
                self?.bigCard.refreshChanpinInfoswila(chanPinModel: _bid_data)
                self?._locan_sk_modls = _bid_data
                self?.layoutPageUI(isBig: true)
            }
            
            if let _sma_data = _model.smallCardData {
                self?._locan_sk_modls = _sma_data
                self?.smallCard.refreshSmallCardTopModel(chanPinModel: _sma_data, chanPinList: _model.cardDatas)
                self?.layoutPageUI(isBig: false)
            }
            
            // 隐私地址
            GlobalCommonFile.shared.privacyURL = _model.sdg
            
            self?.basicScrollContentView.isHidden = false
            self?._service_smd_mods = _model.maria
        }
    }
    
    func layoutPageUI(isBig: Bool) {
        if isBig {
            UIView.animate(withDuration: 0.3) {
                self.basicScrollContentView.snp.remakeConstraints { make in
                    make.edges.equalToSuperview()
                }
                
                self.smallCard.snp.remakeConstraints { make in
                    make.top.width.equalTo(self.basicScrollContentView)
                    make.left.equalTo(self.basicScrollContentView.snp.right)
                    make.bottom.equalToSuperview().offset(-(jk_kTabbarFrameH + 10))
                }
                
                self.view.layoutIfNeeded()
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.basicScrollContentView.snp.remakeConstraints { make in
                    make.verticalEdges.equalToSuperview()
                    make.left.equalToSuperview().offset(-jk_kScreenW)
                    make.width.equalTo(jk_kScreenW)
                }
                
                self.smallCard.snp.remakeConstraints { make in
                    make.horizontalEdges.top.equalToSuperview()
                    make.bottom.equalToSuperview().offset(-(jk_kTabbarFrameH + 10))
                }
                
                self.view.layoutIfNeeded()
            }
        }
        
        changeTabBarBGColor(isClear: isBig)
    }
    
    func gotoChanpinDetailPage(_ chanPinID: String, sender: ActivityAnimationProtocol) {
        guard sender.isEnabled else {
            return
        }
        
        sender.startAnimation()
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/original", requestParams: ["conservative": chanPinID])) {(task: URLSessionDataTask, res: APPSuccessResponse) in
            sender.stopAnimation()
            
            guard let _disk = res.jsonDict, let _auth_skmd = ChanPinOriginalModel.model(with: _disk) else {
                return
            }
            
            guard let _url = _auth_skmd.claude else {
                return
            }
            
            LuYouTool.shared.gotoPage(pageUrl: _url, backtoRoot: true)
        } failure: { _, _ in
            sender.stopAnimation()
        }
    }
    
    @objc func refreshHowmswl() {
        self.pageNetRequest()
    }
    
    @objc func wangsluwoMeiswk(sender: NSNotification) {
        guard let _net_state = sender.object as? DeviceNetObserver.NetworkStatus else {
            return
        }
        
        if _net_state == .NetworkStatus_NoNet || _net_state == .NetworkStatus_LTE {
            self.view.makeToast(APPLanguageInsTool.loadLanguage("neiw_tswp"))
        } else {
            self.pageNetRequest()
        }
    }
    
    func catchsCityListw() {
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("v3/certify/city-init", requestParams: [:])) {(task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _json_arras = res.jsonArray as? NSArray, let _json = _json_arras.modelToJSONString() else {
                return
            }
            
            CityModeswkah.saveCirmapsjSownTosDisak(_json)
        }
    }
}

extension FirstHoViewController: BidCardProtocol {
    func gotoChanPinDetailPage(sender: APPActivityButton) {
        guard let _id = self._locan_sk_modls?.pmid else {
            return
        }
        
        self.gotoChanpinDetailPage(_id, sender: sender)
    }
}

extension FirstHoViewController: SmallCaskwiApplyProtocol {
    func gotoChanpisnwViProtocols(sender: CYSwiftExtension.APPActivityButton) {
        guard let _id = self._locan_sk_modls?.pmid else {
            return
        }
        
        self.gotoChanpinDetailPage(_id, sender: sender)
    }
    
    func gotoChanpisnwViProtocols(sender: CYSwiftExtension.APPActivityButton, idsrel: String) {
        self.gotoChanpinDetailPage(idsrel, sender: sender)
    }
}
