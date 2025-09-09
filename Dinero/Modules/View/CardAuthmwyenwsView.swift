//
//  CardAuthmwyenwsView.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/9.
//

import UIKit

class CardAuthmwyenwsView: UIControl {

    private lazy var titleswjLa: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#202020"), font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium))
    private lazy var whiteVsjwkView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = .white
        view.corner(20)
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private lazy var plackhesHoderimshView: UIImageView = UIImageView(frame: CGRectZero)
    private lazy var updslwBtn: APPActivityButton = APPActivityButton.buildGradientLoadingButton(APPLanguageInsTool.loadLanguage("auth_uoslwo"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.updslwBtn.corner(21)
        self.plackhesHoderimshView.corner(21)
        
        self.addSubview(self.titleswjLa)
        self.addSubview(self.whiteVsjwkView)
        self.whiteVsjwkView.addSubview(self.plackhesHoderimshView)
        self.whiteVsjwkView.addSubview(self.updslwBtn)
        
        self.titleswjLa.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 7)
        }
        
        self.whiteVsjwkView.snp.makeConstraints { make in
            make.top.equalTo(self.titleswjLa.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 7)
            make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 2)
        }
    
        self.plackhesHoderimshView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 3)
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 3)
            make.size.equalTo(CGSize(width: 175, height: 143))
        }
        
        self.updslwBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self.plackhesHoderimshView)
            make.right.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 3)
            make.size.equalTo(CGSize(width: 102, height: 42))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refreshCarskwInfo(model: Eliminating, text: String?) {
        self.titleswjLa.text = text
        if model.locations == "0" {
            self.plackhesHoderimshView.image = UIImage(named: "Face")
        } else {
            if let _t = model.claude, let _t_url = URL(string: _t) {
                self.plackhesHoderimshView.setImageWith(_t_url, placeholder: UIImage(named: "Face"), options: YYWebImageOptions.setImageWithFadeAnimation)
            }
        }
    }
    
    func refreshCFacesjwkswInfo(model: Trump, text: String?) {
        self.titleswjLa.text = text
        if model.locations == "0" {
            self.plackhesHoderimshView.image = UIImage(named: "front")
        } else {
            if let _t = model.claude, let _t_url = URL(string: _t) {
                self.plackhesHoderimshView.setImageWith(_t_url, placeholder: UIImage(named: "front"), options: YYWebImageOptions.setImageWithFadeAnimation)
            }
        }
    }
}
