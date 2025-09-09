//
//  CardFrontKsuwjPoseiView.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/9.
//

import UIKit

class CardFrontKsuwjPoseiView: BasicPresentView {
    
    private lazy var topIsjdmwfhryView: UIImageView = UIImageView(image: UIImage(named: "front"))
    private lazy var skwdiTisp1: UILabel = {
        let view = UILabel.buildNormalTextLabel(APPLanguageInsTool.loadLanguage("camera_tip1"), t_color: Primary_Color1, font: UIFont.systemFont(ofSize: 14))
        view.textAlignment = .left
        return view
    }()
    
    private lazy var dotlabsw1: APPActivityButton = {
        let view = APPActivityButton.buildGradientLoadingButton("")
        view.setTitle("1", for: UIControl.State.normal)
        view.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.corner(11)
        return view
    }()
    
    private lazy var dotlabsw2: APPActivityButton = {
        let view = APPActivityButton.buildGradientLoadingButton("")
        view.setTitle("2", for: UIControl.State.normal)
        view.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.corner(11)
        return view
    }()
    
    private lazy var dotlabsw3: APPActivityButton = {
        let view = APPActivityButton.buildGradientLoadingButton("")
        view.setTitle("3", for: UIControl.State.normal)
        view.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.corner(11)
        return view
    }()
    
    private lazy var tipswksjw1: UILabel = {
        let vew = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#666666"), font: UIFont.systemFont(ofSize: 12))
        vew.textAlignment = .left
        return vew
    }()
    
    private lazy var tipswksjw2: UILabel = {
        let vew = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#666666"), font: UIFont.systemFont(ofSize: 12))
        vew.textAlignment = .left
        return vew
    }()
    
    private lazy var tipswksjw3: UILabel = {
        let vew = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#666666"), font: UIFont.systemFont(ofSize: 12))
        vew.textAlignment = .left
        return vew
    }()
    
    override func buildPresentView() {
        super.buildPresentView()
        
        self.contentView.addSubview(self.topIsjdmwfhryView)
        self.contentView.addSubview(self.skwdiTisp1)
        self.contentView.addSubview(self.dotlabsw1)
        self.contentView.addSubview(self.tipswksjw1)
        self.contentView.addSubview(self.dotlabsw2)
        self.contentView.addSubview(self.tipswksjw2)
        self.contentView.addSubview(self.dotlabsw3)
        self.contentView.addSubview(self.tipswksjw3)
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.topIsjdmwfhryView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.titleLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 2)
        }
        
        self.skwdiTisp1.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 6)
            make.top.equalTo(self.topIsjdmwfhryView.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
        }
        
        self.dotlabsw1.snp.makeConstraints { make in
            make.left.equalTo(self.skwdiTisp1)
            make.top.equalTo(self.skwdiTisp1.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.size.equalTo(22)
        }
        
        self.tipswksjw1.snp.makeConstraints { make in
            make.left.equalTo(self.dotlabsw1.snp.right).offset(LAYOUT_MIN_UNIT)
            make.top.equalTo(self.dotlabsw1).offset(-2)
            make.right.equalTo(self.skwdiTisp1)
        }
        
        self.dotlabsw2.snp.makeConstraints { make in
            make.left.size.equalTo(self.dotlabsw1)
            make.top.equalTo(self.tipswksjw1.snp.bottom).offset(LAYOUT_MIN_UNIT * 2)
        }
        
        self.tipswksjw2.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.tipswksjw1)
            make.top.equalTo(self.dotlabsw2).offset(-2)
        }
        
        self.dotlabsw3.snp.makeConstraints { make in
            make.left.size.equalTo(self.dotlabsw2)
            make.top.equalTo(self.tipswksjw2.snp.bottom).offset(LAYOUT_MIN_UNIT * 2)
        }
        
        self.tipswksjw3.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.tipswksjw2)
            make.top.equalTo(self.dotlabsw3).offset(-2)
            make.bottom.equalTo(self.confirmBtn.snp.top).offset(-LAYOUT_MIN_UNIT * 5)
        }
    }

    func refeskskPosowiewskViws(isFase: Bool, title: String?) {
        self.titleLab.text = title
        if isFase {
            self.topIsjdmwfhryView.image = UIImage(named: "front")
            self.tipswksjw1.text = APPLanguageInsTool.loadLanguage("camera_tip5")
            self.tipswksjw2.text = APPLanguageInsTool.loadLanguage("camera_tip6")
            self.tipswksjw3.text = APPLanguageInsTool.loadLanguage("camera_tip7")
        } else {
            self.topIsjdmwfhryView.image = UIImage(named: "Face")
            self.tipswksjw1.text = APPLanguageInsTool.loadLanguage("camera_tip2")
            self.tipswksjw2.text = APPLanguageInsTool.loadLanguage("camera_tip3")
            self.tipswksjw3.text = APPLanguageInsTool.loadLanguage("camera_tip4")
        }
    }
}
