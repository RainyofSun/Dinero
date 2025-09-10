//
//  InfoAuthwlasoekVeControlController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/9.
//

import UIKit

enum InfoAusekTywsStyle {
    case PersonInskwAutsh
    case WorkIskwlCAuths
    case BanskCarskWis
}

class InfoAuthwlasoekVeControlController: AuthBasicViewController {

    private lazy var contentViewswjhs: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = .white
        view.corner(16)
        return view
    }()
    
    private var info_resw_tupe: (requesjUrls: String, saveUrlslw: String, style: TongJiEventUploadStyle)?
    private var infosw_paswka: [String: String] = [:]
    private var _nesjj_syws: ChanPinAuthElement = .Certif_Job_Info
    
    init(certificationTitle title: String?, nextAuthTitle next: [ChanPinAuthElement : String]? = nil, style: InfoAusekTywsStyle) {
        super.init(certificationTitle: title, nextAuthTitle: next)
        switch style {
        case .PersonInskwAutsh:
            self.info_resw_tupe = ("immediatelying/determination", "immediatelying/elias", .TJ_PersonalInfo)
            self._nesjj_syws = .Certif_Job_Info
        case .WorkIskwlCAuths:
            self.info_resw_tupe = ("immediatelying/ioakimoglou", "immediatelying/maria", .TJ_JobInfo)
            self._nesjj_syws = .Certif_Contesdkcts
        case .BanskCarskWis:
            self.info_resw_tupe = ("immediatelying/elite", "immediatelying/cycles", .TJ_BankInfo)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func buildPageUI() {
        super.buildPageUI()
        self.basicScrollContentView.addSubview(self.contentViewswjhs)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        self.contentViewswjhs.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(jk_kNavFrameH + LAYOUT_MIN_UNIT * 5)
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4)
            make.width.equalTo(jk_kScreenW - LAYOUT_MIN_UNIT * 8)
            make.height.greaterThanOrEqualTo(100)
        }
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        
        guard let _tup = self.info_resw_tupe else {
            return
        }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig(_tup.requesjUrls, requestParams: ["conservative": self.pppp_sid])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _djsi = res.jsonDict, let _moslwk = QuestryQuestionModels.model(with: _djsi), let _mems = _moslwk.memorization else {
                return
            }
            
            self?.buildsInfoUniwksViwsye(modls: _mems)
        }
    }
    
    override func clickNextBusjwk(sender: APPActivityButton) {
        super.clickNextBusjwk(sender: sender)
        
        guard let _tup = self.info_resw_tupe else {
            return
        }
        
        sender.startAnimation()
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig(_tup.saveUrlslw, requestParams: self.infosw_paswka)) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            sender.stopAnimation()
            guard let __sels_wk = self else {
                return
            }
            
            BuryShuJuTool.riskControlRepoeri(type: _tup.style, beginTime: __sels_wk.buryingStartTime, endTime: Date().jk.dateToTimeStamp())
            if __sels_wk._nesjj_syws == .Certif_Job_Info {
                __sels_wk.navigationController?.popToViewController(InfoAuthwlasoekVeControlController(certificationTitle: __sels_wk._next_toelsl_map?[__sels_wk._nesjj_syws], nextAuthTitle: __sels_wk._next_toelsl_map, style: .WorkIskwlCAuths), animated: true)
            }
            
            if __sels_wk._nesjj_syws == .Certif_Contesdkcts {
                __sels_wk.navigationController?.popToViewController(SuwjConsyakwUserViewController(certificationTitle: __sels_wk._next_toelsl_map?[__sels_wk._nesjj_syws], nextAuthTitle: __sels_wk._next_toelsl_map), animated: true)
            }
            
            if __sels_wk._nesjj_syws == .Certif_BankkskCard {
                __sels_wk.navigationController?.popViewController(animated: true)
            }
            
        } failure: { _, _ in
            sender.stopAnimation()
        }
    }
}

private extension InfoAuthwlasoekVeControlController {
    func buildsInfoUniwksViwsye(modls: [Memorization]) {
        var _top_sawksuej: CardCommoenswitemViskw?
        
        modls.enumerated().forEach { (index: Int, cones: Memorization) in
            let view = CardCommoenswitemViskw(frame: CGRectZero, inputsYwhdk: RenZhengElemeent.init(rawValue: cones.ease ?? "") ?? .RZ_Enum)
            view.reoswmInooskwunirModel(mdoel: cones)
            view.unitDelelsjwu = self
            self.contentViewswjhs.addSubview(view)
            if let _kesu = cones.tell, let _valsw = cones.restricting {
                self.infosw_paswka[_kesu] = _valsw
            }
            
            if let _top = _top_sawksuej {
                if index == modls.count - 1 {
                    view.snp.makeConstraints { make in
                        make.horizontalEdges.equalToSuperview()
                        make.top.equalTo(_top.snp.bottom).offset(LAYOUT_MIN_UNIT * 2.5)
                        make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 4)
                    }
                } else {
                    view.snp.makeConstraints { make in
                        make.horizontalEdges.equalToSuperview()
                        make.top.equalTo(_top.snp.bottom).offset(LAYOUT_MIN_UNIT * 2.5)
                    }
                }
            } else {
                view.snp.makeConstraints { make in
                    make.horizontalEdges.equalToSuperview()
                    make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4)
                }
            }
            
            _top_sawksuej = view
        }
    }
}

extension InfoAuthwlasoekVeControlController: InfoUnitProtoslwpProtocl {
    func toushckawUniswInfoskw(itemiew: CardCommoenswitemViskw) {
        self.view.endEditing(true)
        
        guard let _gos = itemiew.unttisTupe?.choise else {
            return
        }
        
        if itemiew.renzhensjakwStyle == .RZ_Enum {
            let view: SinfsltesgPicnskerView = SinfsltesgPicnskerView(frame: UIScreen.main.bounds)
            UIDevice.current.keyWindow().addSubview(view)
            view.clickConfirmClosure = {[weak self] (popView: BasicPresentView, sender: APPActivityButton) in
                guard let _vswe = popView as? SinfsltesgPicnskerView else {
                    return
                }
                
                if let _k = itemiew.unttisTupe?.cacheKeu, let _codes = _vswe.seleshwha_goskw?.lawrence {
                    self?.infosw_paswka[_k] = _codes
                }
                
                itemiew.reloaskwTiels(titles: nil, inspwText: _vswe.seleshwha_goskw?.rans)
                
                popView.dismissPop()
            }
            
            view.showPresent()
        }
        
        if itemiew.renzhensjakwStyle == .RZ_City {
            
        }
    }
    
    func didsWmswEnddiejng(itemViw: CardCommoenswitemViskw, inputVws: String?) {
        if let _tt = inputVws, let _skwk = itemViw.unttisTupe?.cacheKeu {
            self.infosw_paswka[_skwk] = _tt
        }
    }
}
