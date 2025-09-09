//
//  ChanPinProdViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/4.
//

import UIKit

class ChanPinProdViewController: BasicViewController, AutoHiddenNavigationBar {

    private var id_number: String?
    private lazy var topImg: UIImageView = UIImageView(image: UIImage(named: "msine"))
    private lazy var backBtn: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        let originalImage = UIImage(systemName: "chevron.backward")
        let tintedImage = originalImage?.withTintColor(UIColor.hexStringColor(hexString: "#27272E"), renderingMode: .alwaysOriginal)
        view.setImage(tintedImage, for: UIControl.State.normal)
        return view
    }()
    
    private lazy var titleLsjwk: UILabel = UILabel.buildNormalTextLabel("", t_color: Primary_Color_Black, font: UIFont.systemFont(ofSize: 18))
    private lazy var skwldPrisn: CardTipImsjlerifView = CardTipImsjlerifView(frame: CGRectZero, style: CardTipStyle.ChanPin)
    private lazy var infoImsVIes: UIImageView = UIImageView(image: UIImage(named: "product_bg"))
    private lazy var tipswkLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.white, font: UIFont.systemFont(ofSize: 14))
    private lazy var amounswjLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.white, font: UIFont.interFont(size: 34, fontStyle: InterFontWeight.Bold))
    private lazy var rateViwls: ChanPineInfoViwsj = ChanPineInfoViwsj(frame: CGRectZero, style: ChanPineInfoSytwjType.LiXi)
    private lazy var dayViwls: ChanPineInfoViwsj = ChanPineInfoViwsj(frame: CGRectZero, style: ChanPineInfoSytwjType.Time)
    private lazy var tiskwmLab: UILabel = UILabel.buildNormalTextLabel(APPLanguageInsTool.loadLanguage("product_tip2"), t_color: Primary_Color_Black, font: UIFont.systemFont(ofSize: 16))
    private lazy var contentVIew: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (jk_kScreenW - LAYOUT_MIN_UNIT * 11) * 0.5, height: (jk_kScreenW - LAYOUT_MIN_UNIT * 11) * 0.29)
        layout.minimumLineSpacing = LAYOUT_MIN_UNIT * 2.5
        layout.minimumInteritemSpacing = LAYOUT_MIN_UNIT * 2.5
        layout.sectionInset = UIEdgeInsets(top: 0, left: LAYOUT_MIN_UNIT * 4, bottom: 0, right: LAYOUT_MIN_UNIT * 4)
        let view = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.isScrollEnabled = false
        return view
    }()
    
    private lazy var bottomsViwe: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var protocolView: ProtocolView = {
        let viwe = ProtocolView(frame: CGRectZero)
        viwe.isHidden = true
        viwe.setAgreeButton(UIImage(named: "login_disagree")!, selectedImg: UIImage(named: "login_agree")!)
        return viwe
    }()
    
    private lazy var confirmBtn: APPActivityButton = APPActivityButton.buildGradientLoadingButton("")
    
    private var _athsiwn_cousew: [Opposed] = []
    private var protxost_tesat: String?
    private var _next_auhs_modelqkgs: Responded?
    private var _isRefreshwkql: Bool = false
    private var _tiels_map: [ChanPinAuthElement: String] = [:]
    
    init(withCommodityIDNumber idNumber: String) {
        super.init(nibName: nil, bundle: nil)
        self.id_number = idNumber
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.basicScrollContentView.refresh(begin: true)
    }
    
    override func buildPageUI() {
        super.buildPageUI()
        
        self.confirmBtn.addTarget(self, action: #selector(confirmApples(sender: )), for: UIControl.Event.touchUpInside)
        self.backBtn.addTarget(self, action: #selector(goback), for: UIControl.Event.touchUpInside)
        self.topImg.isUserInteractionEnabled = true
        
        self.confirmBtn.corner(16)
        self.protocolView.protocolDelegate = self
        self.contentVIew.delegate = self
        self.contentVIew.dataSource = self
        self.contentVIew.register(ChanPinAuejwlInuejdCollectionViewCell.self, forCellWithReuseIdentifier: ChanPinAuejwlInuejdCollectionViewCell.className())
        
        self.basicScrollContentView.addSubview(self.topImg)
        self.topImg.addSubview(self.backBtn)
        self.topImg.addSubview(self.titleLsjwk)
        self.topImg.addSubview(self.skwldPrisn)
        self.topImg.addSubview(self.infoImsVIes)
        self.infoImsVIes.addSubview(self.tipswkLab)
        self.infoImsVIes.addSubview(self.amounswjLab)
        self.infoImsVIes.addSubview(self.rateViwls)
        self.infoImsVIes.addSubview(self.dayViwls)
        self.basicScrollContentView.addSubview(self.tiskwmLab)
        self.basicScrollContentView.addSubview(self.contentVIew)
        self.view.addSubview(self.bottomsViwe)
        self.bottomsViwe.addSubview(self.protocolView)
        self.bottomsViwe.addSubview(self.confirmBtn)
        
        self.basicScrollContentView.addMJRefresh {[weak self] _ in
            self?.pageNetRequest()
        }
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.bottomsViwe.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
        self.basicScrollContentView.snp.remakeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.bottom.equalTo(self.bottomsViwe.snp.top)
        }
        
        self.topImg.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.width.equalTo(jk_kScreenW)
            make.height.equalTo(jk_kScreenW * 0.77)
        }
        
        self.backBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4.5)
            make.top.equalToSuperview().offset(jk_kStatusBarFrameH + LAYOUT_MIN_UNIT * 2)
            make.size.equalTo(25)
        }
        
        self.titleLsjwk.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.backBtn)
        }
        
        self.skwldPrisn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 3)
            make.top.equalTo(self.titleLsjwk.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.width.equalTo(jk_kScreenW - LAYOUT_MIN_UNIT * 6)
        }
        
        self.infoImsVIes.snp.makeConstraints { make in
            make.left.width.equalTo(self.skwldPrisn)
            make.top.equalTo(self.skwldPrisn.snp.bottom).offset(LAYOUT_MIN_UNIT * 4)
            make.height.equalTo((jk_kScreenW - LAYOUT_MIN_UNIT * 6) * 0.56)
        }
        
        self.tipswkLab.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 7)
            make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4)
        }
        
        self.amounswjLab.snp.makeConstraints { make in
            make.left.equalTo(self.tipswkLab)
            make.top.equalTo(self.tipswkLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
        }
        
        self.dayViwls.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(self.amounswjLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 10)
        }
        
        self.rateViwls.snp.makeConstraints { make in
            make.left.equalTo(self.dayViwls.snp.right)
            make.top.width.equalTo(self.dayViwls)
            make.right.equalToSuperview()
        }
        
        self.tiskwmLab.snp.makeConstraints { make in
            make.left.equalTo(self.infoImsVIes)
            make.top.equalTo(self.infoImsVIes.snp.bottom).offset(LAYOUT_MIN_UNIT * 3.5)
        }
        
        self.contentVIew.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalTo(jk_kScreenW)
            make.top.equalTo(self.tiskwmLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.height.equalTo(123 * 3)
            make.bottom.equalToSuperview()
        }
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        guard let _id = self.id_number else {
            return
        }
        
        self._isRefreshwkql = true
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/archived", requestParams: ["conservative": _id])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            self?.basicScrollContentView.refresh(begin: false)
            self?._isRefreshwkql = false
            guard let _dicts = res.jsonDict, let _swkModel = ChanPineInfoModelsow.model(with: _dicts) else {
                return
            }
            
            GlobalCommonFile.shared.productOrderNum = _swkModel.analyze?.little
            GlobalCommonFile.shared.productID = _swkModel.analyze?.pmid
            GlobalCommonFile.shared.productAmount = _swkModel.analyze?.francine
            
            self?._next_auhs_modelqkgs = _swkModel.responded
            
            self?.titleLsjwk.text = _swkModel.analyze?.pmc
            self?.tipswkLab.text = _swkModel.analyze?.migration
            self?.amounswjLab.text = _swkModel.analyze?.francine
            self?.rateViwls.lsnejwVisLab.text = _swkModel.analyze?.pooled?.record?.gendered
            self?.rateViwls.valsueLas.text = _swkModel.analyze?.pooled?.record?.proxy
            self?.dayViwls.lsnejwVisLab.text = _swkModel.analyze?.pooled?.unlawful?.gendered
            self?.dayViwls.valsueLas.text = _swkModel.analyze?.pooled?.unlawful?.proxy
            self?.confirmBtn.setTitle(_swkModel.analyze?.lowell, for: UIControl.State.normal)
            
            if let _p = _swkModel.aarp?.gendered, !_p.isEmpty {
                self?.protocolView.isHidden = false
                self?.protocolView.setProtocol(NSAttributedString(string: APPLanguageInsTool.loadLanguage("cancel_priss"), attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#666666"), .font: UIFont.systemFont(ofSize: 16)]), protocolPrefix: NSAttributedString(string: _p, attributes: [.foregroundColor: Primary_Color1, .font: UIFont.systemFont(ofSize: 14)]), defaultSelected: false)
                self?.protxost_tesat = _swkModel.aarp?.speed
                
                self?.confirmBtn.snp.makeConstraints { make in
                    make.horizontalEdges.equalToSuperview().inset(50)
                    make.height.equalTo(50)
                    make.bottom.equalToSuperview().offset(-UIDevice.current.keyWindow().safeAreaInsets.bottom - LAYOUT_MIN_UNIT * 3)
                }
                
                self?.protocolView.snp.makeConstraints { make in
                    make.horizontalEdges.greaterThanOrEqualToSuperview().inset(20)
                    make.bottom.equalTo((self?.confirmBtn.snp.top)!).offset(-LAYOUT_MIN_UNIT * 2)
                    make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 2)
                }
                
            } else {
                self?.protocolView.isHidden = true
                self?.confirmBtn.snp.makeConstraints { make in
                    make.horizontalEdges.equalToSuperview().inset(50)
                    make.height.equalTo(50)
                    make.bottom.equalToSuperview().offset(-UIDevice.current.keyWindow().safeAreaInsets.bottom - LAYOUT_MIN_UNIT)
                    make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 2)
                }
            }
            
            if let _ops = _swkModel.opposed {
                self?._athsiwn_cousew.removeAll()
                self?._athsiwn_cousew.append(contentsOf: _ops)
                self?.contentVIew.reloadData()
                self?._tiels_map.removeAll()
                for item in _ops {
                    if let _a = item.aged, let _key = ChanPinAuthElement(rawValue: _a) {
                        self?._tiels_map[_key] = item.gendered
                    }
                }
            }
        } failure: {[weak self] _, _ in
            self?._isRefreshwkql = false
            self?.basicScrollContentView.refresh(begin: false)
        }
    }
    
    @objc func goback() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func confirmApples(sender: APPActivityButton) {
        guard !self._isRefreshwkql else {
            return
        }
        
        if let _nex = self._next_auhs_modelqkgs {
            self.gotoChanpinAuthItem(ChanPinAuthElement(rawValue: _nex.aged ?? "") ?? ChanPinAuthElement.Certif_Query, h5Url: _nex.claude, authTitle: _nex.gendered)
            return
        }
        
        if !self.protocolView.isHidden && !self.protocolView.hasSelected {
            self.view.makeToast(APPLanguageInsTool.loadLanguage("auth_confirm_tip"))
            return
        }
        
        sender.startAnimation()
        self.refreshMineLocations()
        guard let _order = GlobalCommonFile.shared.productOrderNum, let _am = GlobalCommonFile.shared.productAmount else {
            return
        }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/transitions", requestParams: ["computational": _order, "francine": _am])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            sender.stopAnimation()
            guard let _dis = res.jsonDict, let url = _dis["claude"] as? String else {
                return
            }
            
            LuYouTool.shared.gotoPage(pageUrl: url, backtoRoot: url.hasPrefix("http"))
            self?.buryingStartTime = Date().jk.dateToTimeStamp()
            BuryShuJuTool.riskControlRepoeri(type: TongJiEventUploadStyle.TJ_StartApply, beginTime: self?.buryingStartTime, endTime: self?.buryingStartTime, order_numb: _order)
        } failure: { _, _ in
            sender.stopAnimation()
        }
    }
}

private extension ChanPinProdViewController {
    func gotoChanpinAuthItem(_ authTpe: ChanPinAuthElement, h5Url: String? = nil, authTitle: String?) {
        if let _url = h5Url, !_url.isEmpty {
            LuYouTool.shared.gotoPage(pageUrl: _url, backtoRoot: true)
        } else {
            switch authTpe {
            case .Certif_Query:
                self.navigationController?.pushViewController(QueryQuestionwkViewController(certificationTitle: authTitle, nextAuthTitle: self._tiels_map), animated: true)
            case .Certif_ID_Cosujward:
                self.navigationController?.pushViewController(CardAuthswlawViewController(certificationTitle: authTitle, nextAuthTitle: self._tiels_map), animated: true)
            case .Certif_Persopalsjnal_Inuywjfo:
                self.navigationController?.pushViewController(InfoAuthwlasoekVeControlController(certificationTitle: authTitle, nextAuthTitle: self._tiels_map), animated: true)
            case .Certif_Job_Info:
                self.navigationController?.pushViewController(QueryQuestionwkViewController(certificationTitle: authTitle, nextAuthTitle: self._tiels_map), animated: true)
            case .Certif_Contesdkcts:
                self.navigationController?.pushViewController(QueryQuestionwkViewController(certificationTitle: authTitle, nextAuthTitle: self._tiels_map), animated: true)
            case .Certif_BankkskCard:
                self.navigationController?.pushViewController(QueryQuestionwkViewController(certificationTitle: authTitle), animated: true)
            }
        }
    }
}

extension ChanPinProdViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self._athsiwn_cousew.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let _cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChanPinAuejwlInuejdCollectionViewCell.className(), for: indexPath) as? ChanPinAuejwlInuejdCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        _cell.refeshkAuthskwoModels(model: self._athsiwn_cousew[indexPath.item])
        
        return _cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard !self._isRefreshwkql else {
            return
        }
        
        let _model = self._athsiwn_cousew[indexPath.item]
        var _c_wur: ChanPinAuthElement = ChanPinAuthElement(rawValue: _model.aged ?? "") ?? ChanPinAuthElement.Certif_Query
        var title: String? = _model.gendered
        var h5_url: String? = _model.claude
        
        // 如果有认证项，优先跳转到认证
        if _model.locations == "0", let _next_modl = self._next_auhs_modelqkgs {
            _c_wur = ChanPinAuthElement(rawValue: _next_modl.aged ?? "") ?? ChanPinAuthElement.Certif_Query
            title = _next_modl.gendered
            h5_url = _next_modl.claude
        }
        
        self.gotoChanpinAuthItem(_c_wur, h5Url: h5_url, authTitle: title)
    }
}

extension ChanPinProdViewController: APPProtocolDelegate {
    func gotoProtocol() {
        guard let _p = self.protxost_tesat else {
            return
        }
        
        LuYouTool.shared.gotoPage(pageUrl: _p)
    }
}
