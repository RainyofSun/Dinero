//
//  CancelAccoskePopskwViwks.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/6.
//

import UIKit

class CancelAccoskePopskwViwks: BasicPresentView {

    private lazy var phoneLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.white, font: UIFont.systemFont(ofSize: 16))
    private lazy var tiplabskwl: UILabel = {
        let vie = UILabel(frame: CGRectZero)
        vie.numberOfLines = .zero
        return vie
    }()
    
    private lazy var textskContenSkwl: UIView = {
        let voew = UIView(frame: CGRectZero)
        voew.backgroundColor = UIColor.hexStringColor(hexString: "#FFF6CA")
        voew.corner(16)
        return voew
    }()
    
    private lazy var tiplansiw1: UILabel = {
        let vie = UILabel(frame: CGRectZero)
        vie.numberOfLines = .zero
        return vie
    }()
    
    private lazy var tiplansiw2: UILabel = {
        let vie = UILabel(frame: CGRectZero)
        vie.numberOfLines = .zero
        return vie
    }()
    
    private lazy var tiplansiw3: UILabel = {
        let vie = UILabel(frame: CGRectZero)
        vie.numberOfLines = .zero
        return vie
    }()
    
    private lazy var dotViw1: UIView = {
        let dotView: UIView = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: 8, height: 8)))
        dotView.backgroundColor = UIColor.hexStringColor(hexString: "#666666")
        dotView.corner(4)
        return dotView
    }()
    
    private lazy var dotViw2: UIView = {
        let dotView: UIView = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: 8, height: 8)))
        dotView.backgroundColor = UIColor.hexStringColor(hexString: "#666666")
        dotView.corner(4)
        return dotView
    }()
    
    private lazy var dotViw3: UIView = {
        let dotView: UIView = UIView(frame: CGRectZero)
        dotView.backgroundColor = UIColor.hexStringColor(hexString: "#666666")
        dotView.corner(4)
        return dotView
    }()
    
    private(set) lazy var protocolswsVisw: ProtocolView = ProtocolView(frame: CGRectZero)
    
    override func buildPresentView() {
        super.buildPresentView()
        
        self.titleLab.text = APPLanguageInsTool.loadLanguage("setting_cance")
        self.phoneLab.backgroundColor = UIColor.hexStringColor(hexString: "#F34459")
        self.phoneLab.corner(16)
        if let _text = GlobalCommonFile.shared.appLoginInfo?.issn {
            self.phoneLab.text = APPLanguageInsTool.loadLanguage("cancel_wel_tip") + _text.maskPhoneNumber()
        }
        
        let parsty: NSMutableParagraphStyle = NSMutableParagraphStyle()
        parsty.paragraphSpacing = LAYOUT_MIN_UNIT * 2
        let delesieStr: NSMutableAttributedString = NSMutableAttributedString(string: APPLanguageInsTool.loadLanguage("ccancel_del"), attributes: [.foregroundColor: Primary_Color_Black, .font: UIFont.interFont(size: 16, fontStyle: InterFontWeight.Extra_Bold), .paragraphStyle: parsty])
        delesieStr.append(NSAttributedString(string: APPLanguageInsTool.loadLanguage("cancel_del1"), attributes: [.foregroundColor: Primary_Color_Black, .font: UIFont.interFont(size: 16, fontStyle: InterFontWeight.Medium), .paragraphStyle: parsty]))
        self.tiplabskwl.attributedText = delesieStr
        
        let attst1: NSMutableAttributedString = NSMutableAttributedString(string: APPLanguageInsTool.loadLanguage("cancel_tip1"), attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#666666"), .font: UIFont.systemFont(ofSize: 14)])
        self.tiplansiw1.attributedText = attst1
        
        let attst2: NSMutableAttributedString = NSMutableAttributedString(string: APPLanguageInsTool.loadLanguage("cancel_tip2"), attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#666666"), .font: UIFont.systemFont(ofSize: 14)])
        self.tiplansiw2.attributedText = attst2
        
        let attst3: NSMutableAttributedString = NSMutableAttributedString(string: APPLanguageInsTool.loadLanguage("cancel_tip3"), attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#666666"), .font: UIFont.systemFont(ofSize: 14)])
        self.tiplansiw3.attributedText = attst3
        
        self.protocolswsVisw.setAgreeButton(UIImage(named: "login_disagree")!, selectedImg: UIImage(named: "login_agree")!)
        self.protocolswsVisw.setProtocol(NSAttributedString(string: APPLanguageInsTool.loadLanguage("cancel_priss"), attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#666666"), .font: UIFont.systemFont(ofSize: 16)]), protocolPrefix: NSAttributedString(), defaultSelected: false)
        
        self.contentView.addSubview(self.phoneLab)
        self.contentView.addSubview(self.tiplabskwl)
        self.contentView.addSubview(self.textskContenSkwl)
        self.textskContenSkwl.addSubview(self.tiplansiw1)
        self.textskContenSkwl.addSubview(self.tiplansiw2)
        self.textskContenSkwl.addSubview(self.tiplansiw3)
        self.textskContenSkwl.addSubview(self.dotViw1)
        self.textskContenSkwl.addSubview(self.dotViw2)
        self.textskContenSkwl.addSubview(self.dotViw3)
        self.contentView.addSubview(self.protocolswsVisw)
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.phoneLab.snp.makeConstraints { make in
            make.top.equalTo(self.titleLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 4)
            make.height.equalTo(55)
        }
        
        self.tiplabskwl.snp.makeConstraints { make in
            make.top.equalTo(self.phoneLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.horizontalEdges.equalTo(self.phoneLab)
        }
        
        self.textskContenSkwl.snp.makeConstraints { make in
            make.top.equalTo(self.tiplabskwl.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.horizontalEdges.equalTo(self.tiplabskwl)
        }
        
        self.dotViw1.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4)
            make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 5)
            make.size.equalTo(8)
        }
        
        self.tiplansiw1.snp.makeConstraints { make in
            make.top.equalTo(self.dotViw1).offset(-4)
            make.right.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 4)
            make.left.equalTo(self.dotViw1.snp.right).offset(LAYOUT_MIN_UNIT)
        }
        
        self.dotViw2.snp.makeConstraints { make in
            make.left.size.equalTo(self.dotViw1)
            make.top.equalTo(self.tiplansiw1.snp.bottom).offset(LAYOUT_MIN_UNIT * 5)
        }
        
        self.tiplansiw2.snp.makeConstraints { make in
            make.top.equalTo(self.dotViw2).offset(-4)
            make.horizontalEdges.equalTo(self.tiplansiw1)
        }
        
        self.dotViw3.snp.makeConstraints { make in
            make.left.size.equalTo(self.dotViw2)
            make.top.equalTo(self.tiplansiw2.snp.bottom).offset(LAYOUT_MIN_UNIT * 5)
        }
        
        self.tiplansiw3.snp.makeConstraints { make in
            make.top.equalTo(self.dotViw3).offset(-4)
            make.horizontalEdges.equalTo(self.tiplansiw2)
            make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 5)
        }
        
        self.protocolswsVisw.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.confirmBtn)
            make.top.equalTo(self.textskContenSkwl.snp.bottom).offset(LAYOUT_MIN_UNIT * 2)
            make.bottom.equalTo(self.confirmBtn.snp.top).offset(-LAYOUT_MIN_UNIT * 2)
        }
    }

}
