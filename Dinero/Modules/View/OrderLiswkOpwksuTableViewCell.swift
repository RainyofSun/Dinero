//
//  OrderLiswkOpwksuTableViewCell.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/7.
//

import UIKit

class OrderLiswkOpwksuTableViewCell: UITableViewCell {

    private lazy var grentidView: GradientColorView = {
        let vew = GradientColorView(frame: CGRectZero)
        vew.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#FFFFFF"), UIColor.hexStringColor(hexString: "#FEFFE5")], gradientStyle: GradientDirectionStyle.leftToRight)
        vew.corner(16)
        vew.isUserInteractionEnabled = true
        return vew
    }()
    
    private lazy var chanPinView: ProductLogosjVies = ProductLogosjVies(frame: CGRectZero, logoSize: CGSize(width: 36, height: 36))
    private lazy var textskContenSkwl: UIView = {
        let voew = UIView(frame: CGRectZero)
        voew.backgroundColor = UIColor.hexStringColor(hexString: "#FFF6CA")
        voew.corner(16)
        return voew
    }()
    
    private lazy var conspeBtn: APPActivityButton = {
        let view = APPActivityButton.buildGradientLoadingButton("")
        view.corner(12)
        return view
    }()
    
    private lazy var protocolBtn: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        view.isHidden = true
        return view
    }()
    
    private var julsl_wiskk: String?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.contentView.addSubview(self.grentidView)
        self.grentidView.addSubview(self.chanPinView)
        self.grentidView.addSubview(self.textskContenSkwl)
        self.grentidView.addSubview(self.conspeBtn)
        self.grentidView.addSubview(self.protocolBtn)
        
        self.protocolBtn.addTarget(self, action: #selector(cliskwoUrlSwj(sender: )), for: UIControl.Event.touchUpInside)
        
        self.grentidView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 4)
            make.verticalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 1.5)
        }
        
        self.chanPinView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4)
            make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 3)
        }
        
        self.conspeBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self.chanPinView)
            make.right.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 2.5)
            make.height.equalTo(34)
            make.width.greaterThanOrEqualTo(130)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refskrmOrdslwCellmodls(modls: OrderTransition) {
        self.julsl_wiskk = modls.appear
        
        if let _ur_t = modls.jhr {
            self.chanPinView.setProducsImgUrl(url: _ur_t, logoName: modls.pmc, textFont: UIFont.interFont(size: 14, fontStyle: InterFontWeight.Medium))
        }
        
        self.conspeBtn.setTitle(modls.lowell, for: UIControl.State.normal)
        
        if let _mskw = modls.annual {
            self.buildItemswlaiehd(models: _mskw)
        }
        
        if let _p = modls.exempt, !_p.isEmpty {
            self.protocolBtn.isHidden = false
            var att = NSAttributedString(string: _p, attributes: [.foregroundColor: Primary_Color1, .font: UIFont.interFont(size: 14, fontStyle: InterFontWeight.Medium)])
            att = att.jk.setSpecificRangeUnderLine(color: Primary_Color1, range: NSRange(location: .zero, length: _p.count))
            self.protocolBtn.setAttributedTitle(att, for: UIControl.State.normal)
            
            self.textskContenSkwl.snp.remakeConstraints { make in
                make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 2)
                make.top.equalTo(self.chanPinView.snp.bottom).offset(LAYOUT_MIN_UNIT * 2)
                make.height.greaterThanOrEqualTo(100)
            }
            
            self.protocolBtn.snp.remakeConstraints { make in
                make.right.equalTo(self.textskContenSkwl)
                make.top.equalTo(self.textskContenSkwl.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
                make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 3)
            }
            
        } else {
            self.protocolBtn.isHidden = true
            
            self.textskContenSkwl.snp.remakeConstraints { make in
                make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 2)
                make.top.equalTo(self.chanPinView.snp.bottom).offset(LAYOUT_MIN_UNIT * 2)
                make.height.greaterThanOrEqualTo(100)
                make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 3)
            }
        }
    }
    
    @objc func cliskwoUrlSwj(sender: UIButton) {
        guard let _jsuw = self.julsl_wiskk, !_jsuw.isEmpty else {
            return
        }
        
        LuYouTool.shared.gotoPage(pageUrl: _jsuw, backtoRoot: false)
    }
}

private extension OrderLiswkOpwksuTableViewCell {
    func buildItemswlaiehd(models: [Annual]) {
        var _tems_vi: smallInterAndRateView?
        
        models.enumerated().forEach { (index: Int, conw: Annual) in
            let iskw: smallInterAndRateView = smallInterAndRateView(frame: CGRectZero)
            iskw.leftLab.text = conw.gendered
            iskw.rightLab.text = conw.hourly
            iskw.rightLab.textColor = Primary_Color_Black
            
            self.textskContenSkwl.addSubview(iskw)
            
            if let _t = _tems_vi {
                if index == models.count - 1 {
                    iskw.snp.makeConstraints { make in
                        make.horizontalEdges.equalTo(_t)
                        make.top.equalTo(_t.snp.bottom).offset(LAYOUT_MIN_UNIT)
                        make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 3)
                    }
                } else {
                    iskw.snp.makeConstraints { make in
                        make.horizontalEdges.equalTo(_t)
                        make.top.equalTo(_t.snp.bottom).offset(LAYOUT_MIN_UNIT)
                    }
                }
            } else {
                iskw.snp.makeConstraints { make in
                    make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 3)
                    make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 3)
                }
            }
            
            _tems_vi = iskw
        }
    }
}
