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
    private lazy var titleLsjwk: UILabel = UILabel.buildGradientTextLabel("", t_color: Primary_Color_Black, font: UIFont.systemFont(ofSize: 18))
    private lazy var skwldPrisn: CardTipImsjlerifView = CardTipImsjlerifView(frame: CGRectZero, style: CardTipStyle.ChanPin)
    private lazy var infoImsVIes: UIImageView = UIImageView(image: UIImage(named: "product_bg"))
    private lazy var tipswkLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.white, font: UIFont.systemFont(ofSize: 14))
    private lazy var amounswjLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.white, font: UIFont.interFont(size: 34, fontStyle: InterFontWeight.Bold))
    private lazy var rateViwls: ChanPineInfoViwsj = ChanPineInfoViwsj(frame: CGRectZero, style: ChanPineInfoSytwjType.LiXi)
    private lazy var dayViwls: ChanPineInfoViwsj = ChanPineInfoViwsj(frame: CGRectZero, style: ChanPineInfoSytwjType.Time)
    private lazy var tiskwmLab: UILabel = UILabel.buildNormalTextLabel(APPLanguageInsTool.loadLanguage("product_tip2"), t_color: Primary_Color_Black, font: UIFont.systemFont(ofSize: 16))
    
    init(withCommodityIDNumber idNumber: String) {
        super.init(nibName: nil, bundle: nil)
        self.id_number = idNumber
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.pageNetRequest()
    }
    
    override func buildPageUI() {
        super.buildPageUI()
        
        self.topImg.isUserInteractionEnabled = true
        
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
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.topImg.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.width.equalTo(jk_kScreenW)
            make.height.equalTo(jk_kScreenW * 0.77)
        }
        
        self.backBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4.5)
            make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 2.5 + jk_kNavFrameH)
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
            make.top.equalTo(self.tipswkLab.snp.bottom)
        }
        
        self.rateViwls.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(self.amounswjLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 6)
        }
        
        self.dayViwls.snp.makeConstraints { make in
            make.left.equalTo(self.rateViwls.snp.right)
            make.top.width.equalTo(self.rateViwls)
            make.right.equalToSuperview()
        }
        
        self.tiskwmLab.snp.makeConstraints { make in
            make.left.equalTo(self.infoImsVIes)
            make.top.equalTo(self.infoImsVIes.snp.bottom).offset(LAYOUT_MIN_UNIT * 3.5)
        }
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        guard let _id = self.id_number else {
            return
        }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/archived", requestParams: ["conservative": _id])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            
        }
    }
}
