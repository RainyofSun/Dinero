//
//  SuwjConsyakwUserViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/10.
//

import UIKit

class SuwjConsyakwUserViewController: AuthBasicViewController {

    private var emsmers_wkkwcosnwa: [ContactsEmergsuwwhUsersMsowl] = []
    
    override func pageNetRequest() {
        super.pageNetRequest()
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/karamessini", requestParams: ["conservative": self.pppp_sid])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _sjwk = res.jsonDict, let _res_models = ContactswhUserskwoAuthModels.model(with: _sjwk), let _msd = _res_models.statewide else {
                return
            }
            
            self?.builsConstwakViews(mdoslw: _msd)
        }
    }
    
    override func clickNextBusjwk(sender: APPActivityButton) {
        super.clickNextBusjwk(sender: sender)
        
        guard let _shwl = NSArray(array: self.emsmers_wkkwcosnwa).modelToJSONString() else {
            return
        }
        
        sender.startAnimation()
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/aer", requestParams: ["conservative": self.pppp_sid, "unstats": _shwl])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            sender.startAnimation()
            guard let __sela_sw = self else {
                return
            }
            
            BuryShuJuTool.riskControlRepoeri(type: TongJiEventUploadStyle.TJ_LianXiRenInfo, beginTime: self?.buryingStartTime, endTime: Date().jk.dateToTimeStamp())
            __sela_sw.navigationController?.jk.popCurrentAndPush(vc:InfoAuthwlasoekVeControlController(certificationTitle: __sela_sw._next_toelsl_map?[ChanPinAuthElement.Certif_BankkskCard], nextAuthTitle: __sela_sw._next_toelsl_map, style: InfoAusekTywsStyle.BanskCarskWis), animated: true)
        } failure: { _, _ in
            sender.stopAnimation()
        }
    }
}

private extension SuwjConsyakwUserViewController {
    func builsConstwakViews(mdoslw: [StatewideItem]) {
        var _top_viwks: ContactswhUserskwoAuthView?
        
        mdoslw.enumerated().forEach { (index: Int, item: StatewideItem) in
            let view = ContactswhUserskwoAuthView(frame: CGRectZero)
            view.reloaskdContastwjejsViews(mskw: item)
            view.unitDelelsjwu = self
            view.tag = 2000 + index
            self.basicScrollContentView.addSubview(view)
            // 保存信息
            self.saveEmersegenceyCosnwjsInfsow(personTags: view.tag, naes: item.rans, phoenswk: item.promotions, relasuwj: item.harassed)
            
            if let _tlw = _top_viwks {
                if index == mdoslw.count - 1 {
                    view.snp.makeConstraints { make in
                        make.horizontalEdges.equalTo(_tlw)
                        make.top.equalTo(_tlw.snp.bottom).offset(LAYOUT_MIN_UNIT * 4)
                        make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 4)
                    }
                } else {
                    view.snp.makeConstraints { make in
                        make.horizontalEdges.equalTo(_tlw)
                        make.top.equalTo(_tlw.snp.bottom).offset(LAYOUT_MIN_UNIT * 4)
                    }
                }
            } else {
                view.snp.makeConstraints { make in
                    make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4 + jk_kNavFrameH)
                    make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4)
                    make.width.equalTo(jk_kScreenW - LAYOUT_MIN_UNIT * 8)
                }
            }
            
            _top_viwks = view
        }
    }
    
    func saveEmersegenceyCosnwjsInfsow(personTags: Int, naes: String? = nil, phoenswk: String? = nil, relasuwj: String? = nil) {
        if let _ines = self.emsmers_wkkwcosnwa.firstIndex(where: {$0.personTag == personTags}) {
            self.emsmers_wkkwcosnwa[_ines].personTag = personTags
            if let _nsa = naes {
                self.emsmers_wkkwcosnwa[_ines].rans = _nsa
            }
            
            if let _pskw = phoenswk {
                self.emsmers_wkkwcosnwa[_ines].promotions = _pskw
            }
            
            if let _resw = relasuwj {
                self.emsmers_wkkwcosnwa[_ines].harassed = _resw
            }
        } else {
            let mdoslw = ContactsEmergsuwwhUsersMsowl()
            if let _nsa = naes {
                mdoslw.rans = _nsa
            }
            
            if let _pskw = phoenswk {
                mdoslw.promotions = _pskw
            }
            
            if let _resw = relasuwj {
                mdoslw.harassed = _resw
            }
            
            mdoslw.personTag = personTags
            
            self.emsmers_wkkwcosnwa.append(mdoslw)
        }
    }
    
    func catshcAllswkxConatst() {
        APPContactManager.sharedInstance().accessContactsComplection { (sucws: Bool, presw: [APPPerson]?) in
            guard sucws else {
                return
            }
            
            let repeowisarsiw: NSMutableArray = NSMutableArray()
            
            presw?.forEach { (item: APPPerson) in
                let psiwk = ContactswhUsersMsowl()
                
                if let _psw = item.birthday.brithdayDate {
                    psiwk.protections = _psw.jk.toformatterTimeString(formatter: "yyyy-MM-dd")
                }
                
                var phsowStr: [String] = []
                item.phones.forEach { (spw: APPPhone) in
                    phsowStr.append(spw.phone)
                }
                
                psiwk.chase = phsowStr.joined(separator: ",")
                psiwk.distribution = item.emails.first?.email
                
                if let _csa = item.creationDate {
                    psiwk.empirically = _csa.jk.toformatterTimeString(formatter: "yyyy-MM-dd")
                }
                
                if let _csa = item.modificationDate {
                    psiwk.reconsidering = _csa.jk.toformatterTimeString(formatter: "yyyy-MM-dd")
                }
                
                if let smwo = item.note {
                    psiwk.influenced = smwo
                }
                
                repeowisarsiw.append(psiwk)
            }
            
            if var _jsow_swk = repeowisarsiw.modelToJSONString() {
                #if DEBUG
                _jsow_swk = "[{\"reinhard\":\"13303029382\",\"jres\":\"王XX\"}]"
                #endif
                APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/sof", requestParams: ["unstats": _jsow_swk])) { _, _ in
                    APPCocoaLog.debug("------========== 通讯录上传完成 ============")
                }
            }
        }
    }
}

extension SuwjConsyakwUserViewController: InfoUnitProtoslwpProtocl {
    func toushckawUniswInfoskw(itemiew: UIView) {
        guard let skwswla = itemiew as? ContactswhUserskwoAuthView else {
            return
        }
        
        if skwswla.chanspwin {
            if let _gos = skwswla.ywhstisTupe?.choise {
                let view: SinfsltesgPicnskerView = SinfsltesgPicnskerView(frame: UIScreen.main.bounds)
                view.reloadSingsketswjajMods(moslw: _gos)
                UIDevice.current.keyWindow().addSubview(view)
                view.clickConfirmClosure = { (popView: BasicPresentView, sender: APPActivityButton) in
                    guard let _vswe = popView as? SinfsltesgPicnskerView else {
                        return
                    }
                    
                    skwswla.reskwiUserrelauw(reaiw: _vswe.seleshwha_goskw?.rans)
                    self.saveEmersegenceyCosnwjsInfsow(personTags: skwswla.tag, relasuwj: _vswe.seleshwha_goskw?.lawrence)
                    
                    popView.dismissPop()
                }
                
                view.showPresent()
            }
        } else {
            APPContactManager.sharedInstance().requestAddressBookAuthorization {[weak self] (sAuws: Bool) in
                guard !sAuws else {
                    self?.catshcAllswkxConatst()
                    
                    APPContactManager.sharedInstance().selectContact(at: self!) {[weak self] (name: String?, phone: String?) in
                        if let _n = name, let _p = phone {
                            skwswla.resjwkeiUserPhoe(phone: "\(_n)-\(_p)")
                            self?.saveEmersegenceyCosnwjsInfsow(personTags: skwswla.tag, naes: _n, phoenswk: _p)
                        }
                    }
                    return
                }
                
                self?.showSystemStyleSettingAlert(APPLanguageInsTool.loadLanguage("const_tip"), okTitle: nil, cancelTitle: nil)
            }
        }
    }
    
    func didsWmswEnddiejng(itemViw: UIView, inputVws: String?) {
        
    }
}
