//
//  FirstHoViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit

class FirstHoViewController: BasicViewController, AutoHiddenNavigationBar {

    private lazy var bigCard: BigCardViskdl = BigCardViskdl(frame: CGRectZero)
    private var _locan_sk_modls: Katz?
    private var _service_smd_mods: Maria?
    
    override var changeTabBarColor: Bool {
        return true
    }
    
    override func buildPageUI() {
        super.buildPageUI()
        
        self.basicScrollContentView.isPagingEnabled = true
        self.basicScrollContentView.isScrollEnabled = false
        
        self.bigCard.bihdelegate = self
        self.basicScrollContentView.addSubview(self.bigCard)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.basicScrollContentView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.bigCard.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.size.equalTo(self.view.size)
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
                
            }
            
            self?._service_smd_mods = _model.maria
        }
    }
    
    func layoutPageUI(isBig: Bool) {
        if isBig {
            self.basicScrollContentView.setContentOffsetX(CGFloat.zero, animated: true)
        } else {
            self.basicScrollContentView.setContentOffsetX(jk_kScreenW, animated: true)
        }
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
}

extension FirstHoViewController: BidCardProtocol {
    func gotoChanPinDetailPage(sender: APPActivityButton) {
        guard let _id = self._locan_sk_modls?.pmid else {
            return
        }
        
        self.gotoChanpinDetailPage("\(_id)", sender: sender)
    }
}
