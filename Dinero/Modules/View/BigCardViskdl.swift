//
//  BigCardViskdl.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/4.
//

import UIKit

protocol BidCardProtocol: AnyObject {
    func gotoChanPinDetailPage(sender: APPActivityButton)
}

class BigCardViskdl: UIImageView {

    weak open var bihdelegate: BidCardProtocol?
    
    private lazy var logoView: ProductLogosjVies = ProductLogosjVies(frame: CGRectZero)
    private lazy var tipLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.black, font: UIFont.systemFont(ofSize: 14))
    private lazy var amountskdLab: JianBianLab = {
        let view = JianBianLab(frame: CGRectZero)
        view.font = UIFont.interFont(size: 64, fontStyle: InterFontWeight.Regular_Black_Italic)
        view.strokeColor = UIColor.white
        view.gradientColors = [UIColor.hexStringColor(hexString: "#D24D5D"), UIColor.hexStringColor(hexString: "#5C1C35")]
        view.strokeWidth = 6.0
        return view
    }()
    
    private lazy var pInfoView: ProductTermAndRateViskw = ProductTermAndRateViskw(frame: CGRectZero)
    private lazy var applyBtn: APPActivityButton = {
        let view = APPActivityButton(type: UIButton.ButtonType.custom)
        view.setBackgroundImage(UIImage(named: "home_apply"), for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        view.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.titleEdgeInsets = UIEdgeInsets(top: -6, left: 0, bottom: 0, right: 0)
        return view
    }()
    
    private lazy var tipImgView: UIImageView = UIImageView(image: UIImage(named: (GlobalCommonFile.shared.countryCode == 1 ? "home_big_tip" : "home_big_tip_es")))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.image = UIImage(named: "home_bg")
        self.isUserInteractionEnabled = true
        self.contentMode = .scaleAspectFill
        
        self.applyBtn.addTarget(self, action: #selector(clickApplyButton(sender: )), for: UIControl.Event.touchUpInside)
        
        self.addSubview(self.logoView)
        self.addSubview(self.tipLab)
        self.addSubview(self.amountskdLab)
        self.addSubview(self.pInfoView)
        self.addSubview(self.applyBtn)
        self.addSubview(self.tipImgView)
        
        self.logoView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4)
            make.top.equalToSuperview().offset(50)
        }
        
        self.tipLab.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.logoView.snp.bottom).offset(LAYOUT_MIN_UNIT * 2)
        }
        
        self.amountskdLab.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.tipLab.snp.bottom)
        }
        
        self.pInfoView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 8)
            make.top.equalTo(self.amountskdLab.snp.bottom).offset(LAYOUT_MIN_UNIT)
        }
        
        self.applyBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.pInfoView.snp.bottom).offset(200)
        }
        
        self.tipImgView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.applyBtn.snp.bottom).offset(LAYOUT_MIN_UNIT)
            make.size.equalTo(CGSize(width: (jk_kScreenW - 32), height: (jk_kScreenW - 32) * 0.71))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refreshChanpinInfoswila(chanPinModel: Katz) {
        if let _url = chanPinModel.jhr {
            self.logoView.setProducsImgUrl(url: _url, logoName: chanPinModel.pmc)
        }
        
        self.tipLab.text = chanPinModel.seth
        self.amountskdLab.text = chanPinModel.taylor
        self.applyBtn.setTitle(chanPinModel.lowell, for: UIControl.State.normal)
        
        let attribuskdk: NSMutableAttributedString = NSMutableAttributedString()
        if let _rate_t = chanPinModel.amelia, let _rate = chanPinModel.sanders {
            attribuskdk.append(NSAttributedString(string: _rate_t, attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#666666"), .font: UIFont.systemFont(ofSize: 12)]))
            attribuskdk.append(NSAttributedString(string: "  \(_rate)", attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 16)]))
        }
        
        if let _day_t = chanPinModel.dan, let _day = chanPinModel.haviland {
            attribuskdk.append(NSAttributedString(string: "   "))
            attribuskdk.append(NSAttributedString(string: _day_t, attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#666666"), .font: UIFont.systemFont(ofSize: 12)]))
            attribuskdk.append(NSAttributedString(string: "  \(_day)", attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 16)]))
        }
        
        self.pInfoView.productInfoAttributeStdks(atts: attribuskdk)
    }
    
    @objc func clickApplyButton(sender: APPActivityButton) {
        self.bihdelegate?.gotoChanPinDetailPage(sender: sender)
    }
}
