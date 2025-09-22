//
//  CardAuthswlawViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/8.
//

import UIKit

class CardAuthswlawViewController: AuthBasicViewController {

    private lazy var cardVjswirye: CardAuthmwyenwsView = CardAuthmwyenwsView(frame: CGRectZero)
    private lazy var faceskjfhyeView: CardAuthmwyenwsView = CardAuthmwyenwsView(frame: CGRectZero)
    private lazy var isFaceskwAuth: Bool = false
    private lazy var cameraTolls: APPMultimediaTool = APPMultimediaTool(presentViewController: self)
    private var cardks_indo_model: CardAuthmwNsiwkeMode?
    
    override func buildPageUI() {
        super.buildPageUI()
        
        self.cameraTolls.toolDelegate = self
        self.cardVjswirye.addTarget(self, action: #selector(clickCardAuth(sender: )), for: UIControl.Event.touchUpInside)
        self.faceskjfhyeView.addTarget(self, action: #selector(clickfaceAsjwkTh(sender: )), for: UIControl.Event.touchUpInside)
        
        self.basicScrollContentView.addSubview(self.cardVjswirye)
        self.basicScrollContentView.addSubview(self.faceskjfhyeView)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        self.cardVjswirye.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(jk_kNavFrameH + LAYOUT_MIN_UNIT * 5)
            make.left.equalToSuperview()
            make.width.equalTo(jk_kScreenW)
        }
        
        self.faceskjfhyeView.snp.makeConstraints { make in
            make.left.width.equalTo(self.cardVjswirye)
            make.top.equalTo(self.cardVjswirye.snp.bottom).offset(LAYOUT_MIN_UNIT * 4.5)
        }
    }

    override func pageNetRequest() {
        super.pageNetRequest()
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/max", requestParams: ["conservative": self.pppp_sid])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _jso = res.jsonDict, let _dmsl = CardAuthmwNsiwkeMode.model(with: _jso) else {
                return
            }
            
            if let _fr = _dmsl.eliminating {
                self?.cardVjswirye.refreshCarskwInfo(model: _fr, text: _dmsl.id_front_msg)
            }
            
            if let _nsk = _dmsl.trump {
                self?.faceskjfhyeView.refreshCFacesjwkswInfo(model: _nsk, text: _dmsl.face_msg)
            }
            
            self?.isFaceskwAuth = _dmsl.eliminating?.locations == "1"
            self?.cardks_indo_model = _dmsl
        }
    }
    
    override func clickNextBusjwk(sender: APPActivityButton) {
        super.clickNextBusjwk(sender: sender)
        guard let _ds = self.cardks_indo_model else {
            return
        }
        
        if let _card_com = _ds.eliminating?.locations, _card_com == "0" {
            self.clickCardAuth(sender: self.cardVjswirye)
            return
        }
        
        if let _fac_scom = _ds.trump?.locations, _fac_scom == "0" {
            self.clickfaceAsjwkTh(sender: self.faceskjfhyeView)
            return
        }
        
        self.navigationController?.jk.popCurrentAndPush(vc: InfoAuthwlasoekVeControlController(certificationTitle: self._next_toelsl_map?[ChanPinAuthElement.Certif_Persopalsjnal_Inuywjfo], nextAuthTitle: self._next_toelsl_map, style: InfoAusekTywsStyle.PersonInskwAutsh), animated: true)
    }
    
    @objc func clickCardAuth(sender: CardAuthmwyenwsView) {
        guard let _mde = self.cardks_indo_model else {
            return
        }
        
        guard let _com = _mde.eliminating?.locations, _com != "1" else {
            return
        }
        
        self.refreshMineLocations()
        let popView = CardFrontKsuwjPoseiView(frame: CGRectZero)
        popView.refeskskPosowiewskViws(isFase: false, title: _mde.id_front_msg)
        UIDevice.current.keyWindow().addSubview(popView)
        popView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        popView.clickConfirmClosure = {[weak self] (popVie: BasicPresentView, sender: APPActivityButton) in
            self?.buryingStartTime = Date().jk.dateToTimeStamp()
            self?.cameraTolls.takingPhoto(false)
            popVie.dismissPop()
        }

        popView.showPresent()
    }
    
    @objc func clickfaceAsjwkTh(sender: CardAuthmwyenwsView) {
        guard let _mde = self.cardks_indo_model else {
            return
        }
        
        guard let _com = _mde.eliminating?.locations, _com == "1" else {
            self.view.makeToast(APPLanguageInsTool.loadLanguage("auth_card_tis"))
            return
        }
        
        guard let _com = _mde.trump?.locations, _com != "1" else {
            return
        }
        
        let popView = CardFrontKsuwjPoseiView(frame: CGRectZero)
        popView.refeskskPosowiewskViws(isFase: true, title: _mde.face_msg)
        UIDevice.current.keyWindow().addSubview(popView)
        popView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        popView.clickConfirmClosure = {[weak self] (popVie: BasicPresentView, sender: APPActivityButton) in
            self?.buryingStartTime = Date().jk.dateToTimeStamp()
            self?.cameraTolls.takingPhoto(true)
            
            popVie.dismissPop()
        }

        popView.showPresent()
    }
}

private extension CardAuthswlawViewController {
    func upaslowkLocskeImagePic(_ filePaje: String) {
        if !FileManager.default.fileExists(atPath: filePaje) {
            APPCocoaLog.debug(" -------- 本地没图片 ------------")
            return
        }
        
        self.view.makeToastActivity(CSToastPositionCenter)
        let uploasdparams: [String: String] = ["discriminationPolicies": filePaje, "lawrence": self.isFaceskwAuth ? "10" : "11"]
        
        let config: NetworkRequestConfig = NetworkRequestConfig.defaultRequestConfig("immediatelying/chase", requestParams: uploasdparams)
        config.requestType = .upload
        APPNetRequestManager.afnReqeustType(config) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse)  in
            guard let __self_sek = self else {
                return
            }
            
            __self_sek.view.hideToastActivity()
            
            if __self_sek.isFaceskwAuth {
                BuryShuJuTool.riskControlRepoeri(type: TongJiEventUploadStyle.TJ_TakingFace, beginTime: __self_sek.buryingStartTime, endTime: Date().jk.dateToTimeStamp())
                __self_sek.navigationController?.jk.popCurrentAndPush(vc: InfoAuthwlasoekVeControlController(certificationTitle: __self_sek._next_toelsl_map?[ChanPinAuthElement.Certif_Persopalsjnal_Inuywjfo], nextAuthTitle: __self_sek._next_toelsl_map, style: InfoAusekTywsStyle.PersonInskwAutsh), animated: true)
            } else {
                guard let _dis = res.jsonDict, let _as_resils = CardAuthResulwdMowsl.model(with: _dis) else {
                    return
                }
                
                if _as_resils.reversing == "1" {
                    let prosjeVC: userIndoswksAuthViewController = userIndoswksAuthViewController()
                    prosjeVC.modalPresentationStyle = .overCurrentContext
                    prosjeVC.presentView.refeshUsjeriDksInfos(model: _as_resils)
                    __self_sek.present(prosjeVC, animated: true)
                    
                    prosjeVC.presentView.clickConfirmClosure = { (popVie: BasicPresentView, sender: APPActivityButton) in
                        guard let _indo = popVie as? CardUsesidnwIfosKsuwjPoseiView, !_indo.infoPasjwsDicts.isEmpty else {
                            return
                        }
                        
                        sender.startAnimation()
                        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/issn", requestParams: _indo.infoPasjwsDicts)) { (task: URLSessionDataTask, res :APPSuccessResponse) in
                            sender.stopAnimation()
                            BuryShuJuTool.riskControlRepoeri(type: TongJiEventUploadStyle.TJ_IDCardAlert, beginTime: __self_sek.buryingStartTime, endTime: Date().jk.dateToTimeStamp())
                            __self_sek.cardks_indo_model?.eliminating?.locations = "1"
                            __self_sek.isFaceskwAuth = true
                            _indo.dismissPop()
                            __self_sek.cardVjswirye.refreshUpdaloejesColros()
                        } failure: { _, _ in
                            sender.stopAnimation()
                        }
                    }
 
                } else {
                    BuryShuJuTool.riskControlRepoeri(type: TongJiEventUploadStyle.TJ_IDCardAlert, beginTime: __self_sek.buryingStartTime, endTime: Date().jk.dateToTimeStamp())
                    __self_sek.cardks_indo_model?.eliminating?.locations = "1"
                    __self_sek.isFaceskwAuth = true
                }
                
                if let _url = _as_resils.claude, let _elimian = __self_sek.cardks_indo_model?.eliminating {
                    _elimian.claude = _url
                    __self_sek.cardVjswirye.refreshCarskwInfo(model: _elimian, text: nil)
                }
            }
        } failure: {[weak self] _, _ in
            self?.view.hideToastActivity()
        }
    }
}

extension CardAuthswlawViewController: APPMultimediaProtocol {
    func selectedPictureFormMultimediaComplete(_ filePath: String) {
        self.upaslowkLocskeImagePic(filePath)
    }
}
