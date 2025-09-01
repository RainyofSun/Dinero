//
//  StartFlashViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit

protocol FlashProtocol: AnyObject {
    func didMissFlashViews()
}

class StartFlashViewController: BasicViewController {

    weak open var sDelegate: FlashProtocol?
    
    private lazy var contentImgView = UIImageView(image: UIImage(named: "startFass"))
    private lazy var tryBtn = UIButton.buildGradientLoadingButton(APPLanguageInsTool.loadLanguage("start_try"))
    
    override func buildPageUI() {
     
        self.tryBtn.isHidden = true
        self.contentImgView.isUserInteractionEnabled = true
        self.tryBtn.corner(16)
        
        self.view.addSubview(self.contentImgView)
        self.contentImgView.addSubview(self.tryBtn)
        
        self.tryBtn.addTarget(self, action: #selector(letusTryAgain(sender: )), for: UIControl.Event.touchUpInside)
    }
    
    override func layoutPageViews() {
        
        self.contentImgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.tryBtn.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-100)
            make.height.equalTo(50)
            make.horizontalEdges.equalToSuperview().inset(50)
        }
    }
    
    override func pageNetRequest() {
        // 使用代理
        let useProcy = UIDevice.getProxyStatus("https://baidu.com") ? "1" : "0"
        let appYuYan: String = UIDevice.jk.appLanguage
        let useVPN = UIDevice.isVPNEnabled() ? "1" : "0"
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/associations", requestParams: ["olof": useProcy, "associations": appYuYan, "rooth": useVPN])) { task, res in
            APPCocoaLog.debug("sssssss")
        } failure: { task, error in
            
        }

    }
    
    @objc func letusTryAgain(sender: APPActivityButton) {
        self.sDelegate?.didMissFlashViews()
    }
}
