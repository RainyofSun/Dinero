//
//  SmallCardViskaowk.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/5.
//

import UIKit

protocol SmallCaskwiApplyProtocol: AnyObject {
    func gotoChanpisnwViProtocols(sender: APPActivityButton)
    func gotoChanpisnwViProtocols(sender: APPActivityButton, idsrel: String)
}

class SmallCardViskaowk: UIView {

    weak open var samllDelesjek: SmallCaskwiApplyProtocol?
    
    private lazy var logoView: ProductLogosjVies = ProductLogosjVies(frame: CGRectZero, logoSize: CGSize(width: 33, height: 33))
    private lazy var bgImgView: UIImageView = UIImageView(image: UIImage(named: "home_small"))
    private lazy var tipLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.white, font: UIFont.systemFont(ofSize: 14))
    private lazy var amountskdLab: JianBianLab = {
        var fontSize = 64.0
        if UIDevice.jk.isIpad() || jk_kScreenW <= 414 {
            fontSize = 50.0
        }
        
        let view = JianBianLab(frame: CGRectZero)
        view.font = UIFont.interFont(size: fontSize, fontStyle: InterFontWeight.Regular_Black_Italic)
        view.strokeColor = UIColor.white
        view.gradientColors = [UIColor.hexStringColor(hexString: "#D24D5D"), UIColor.hexStringColor(hexString: "#5C1C35")]
        view.strokeWidth = 6.0
        return view
    }()
    
    private lazy var contrilws: UIControl = UIControl(frame: CGRectZero)
    
    private lazy var pInfoView: ProductTermAndRateViskw = ProductTermAndRateViskw(frame: CGRectZero)
    
    private lazy var applyBtn: APPActivityButton = {
        let view = APPActivityButton.buildGradientLoadingButton("")
        view.corner(16)
        view.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return view
    }()
    
    private lazy var listView: UITableView = {
        let view = UITableView(frame: CGRectZero, style: UITableView.Style.plain)
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.separatorStyle = .none
        return view
    }()
    
    private var listSource: [Katz] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.logoView)
        self.addSubview(self.bgImgView)
        self.bgImgView.isUserInteractionEnabled = true
        self.bgImgView.addSubview(self.tipLab)
        self.bgImgView.addSubview(self.amountskdLab)
        self.bgImgView.addSubview(self.pInfoView)
        self.bgImgView.addSubview(self.applyBtn)
        self.bgImgView.addSubview(self.contrilws)
        
        self.listView.register(SmallCardPlishelwTableViewCell.self, forCellReuseIdentifier: SmallCardPlishelwTableViewCell.className())
        self.listView.delegate = self
        self.listView.dataSource = self
        self.addSubview(self.listView)
        
        self.contrilws.addTarget(self, action: #selector(cliskAppleFunctions(sender: )), for: UIControl.Event.touchUpInside)
        
        self.logoView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4)
            make.top.equalToSuperview().offset(UIDevice.jk.isIpad() ? 20 : 50)
            make.height.equalTo(35)
        }
        
        self.bgImgView.snp.makeConstraints { make in
            make.top.equalTo(self.logoView.snp.bottom).offset(LAYOUT_MIN_UNIT * 2)
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 4)
            make.height.equalTo((jk_kScreenW - 32) * 0.71)
        }
        
        self.tipLab.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset((jk_kScreenW - 32) * 0.071)
        }
        
        self.amountskdLab.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.tipLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
        }
        
        self.pInfoView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 5)
            make.top.equalTo(self.amountskdLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 1.5)
        }
        
        self.applyBtn.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 9)
            make.top.equalTo(self.pInfoView.snp.bottom).offset(UIDevice.jk.isIpad() ? LAYOUT_MIN_UNIT : LAYOUT_MIN_UNIT * 2.5)
            make.height.equalTo(50)
        }
        
        self.contrilws.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        if UIDevice.jk.isIpad() {
            self.listView.snp.makeConstraints { make in
                make.horizontalEdges.equalToSuperview()
                make.top.equalTo(self.bgImgView.snp.bottom).offset(LAYOUT_MIN_UNIT * 1.5)
                make.height.greaterThanOrEqualTo(330)
                make.bottom.equalToSuperview()
            }
        } else {
            self.listView.snp.makeConstraints { make in
                make.horizontalEdges.equalToSuperview()
                make.top.equalTo(self.bgImgView.snp.bottom).offset(LAYOUT_MIN_UNIT * 1.5)
                make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refreshSmallCardTopModel(chanPinModel: Katz, chanPinList list: [Katz]?) {
        if let _url = chanPinModel.jhr {
            self.logoView.setProducsImgUrl(url: _url, logoName: chanPinModel.pmc)
        }
        
        self.tipLab.text = chanPinModel.seth
        self.amountskdLab.text = chanPinModel.taylor
        self.applyBtn.setTitle(chanPinModel.lowell, for: UIControl.State.normal)
        
        let attribuskdk: NSMutableAttributedString = NSMutableAttributedString()
        if let _rate_t = chanPinModel.amelia, let _rate = chanPinModel.haviland {
            attribuskdk.append(NSAttributedString(string: _rate_t, attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#666666"), .font: UIFont.systemFont(ofSize: 12)]))
            attribuskdk.append(NSAttributedString(string: "  \(_rate)", attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 16)]))
        }
        
        if let _day_t = chanPinModel.dan, let _day = chanPinModel.sanders {
            attribuskdk.append(NSAttributedString(string: "   "))
            attribuskdk.append(NSAttributedString(string: _day_t, attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#666666"), .font: UIFont.systemFont(ofSize: 12)]))
            attribuskdk.append(NSAttributedString(string: "  \(_day)", attributes: [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 16)]))
        }
        
        self.pInfoView.productInfoAttributeStdks(atts: attribuskdk)
        
        if let _p = list {
            self.listSource.removeAll()
            self.listSource.append(contentsOf: _p)
            self.listView.reloadData()
        }
    }
    
    @objc func cliskAppleFunctions(sender: UIControl) {
        self.samllDelesjek?.gotoChanpisnwViProtocols(sender: self.applyBtn)
    }
}

extension SmallCardViskaowk: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _cel = tableView.dequeueReusableCell(withIdentifier: SmallCardPlishelwTableViewCell.className(), for: indexPath) as? SmallCardPlishelwTableViewCell else {
            return UITableViewCell()
        }
        
        _cel.refreshSkdlwCellSojwkc(model: self.listSource[indexPath.row])
        return _cel
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let _cell = tableView.cellForRow(at: indexPath) as? SmallCardPlishelwTableViewCell, let _id = self.listSource[indexPath.row].pmid else {
            return
        }
        
        self.samllDelesjek?.gotoChanpisnwViProtocols(sender: _cell.applyBtn, idsrel: _id)
    }
}
