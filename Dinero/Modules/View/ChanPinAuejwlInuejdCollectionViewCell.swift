//
//  ChanPinAuejwlInuejdCollectionViewCell.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/8.
//

import UIKit

class ChanPinAuejwlInuejdCollectionViewCell: UICollectionViewCell {
    
    private lazy var bgView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = .white
        view.corner(11)
        view.jk.addShadow(shadowColor: UIColor.black.withAlphaComponent(0.8), shadowOffset: CGSizeZero, shadowOpacity: 7)
        return view
    }()
    
    private lazy var logoswimsg: UIImageView = {
        let view = UIImageView(frame: CGRectZero)
        view.corner(15)
        return view
    }()
    
    private lazy var proswNameLasL: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#202020"), font: UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium))
    private lazy var yejskwContnsViwsk: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#FFEDBA")
        view.corner(4)
        return view
    }()
    
    private lazy var stsuwjsLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#999999"), font: UIFont.systemFont(ofSize: 11))
    private lazy var stauswImgViws: UIImageView = {
        let view = UIImageView(frame: CGRectZero)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.proswNameLasL.textAlignment = .left
        
        self.contentView.addSubview(self.bgView)
        self.bgView.addSubview(self.logoswimsg)
        self.bgView.addSubview(self.proswNameLasL)
        self.bgView.addSubview(self.yejskwContnsViwsk)
        self.yejskwContnsViwsk.addSubview(self.stsuwjsLab)
        self.yejskwContnsViwsk.addSubview(self.stauswImgViws)
        
        self.bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.logoswimsg.snp.makeConstraints { make in
            make.size.equalTo(41)
            make.left.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 2)
        }
        
        self.proswNameLasL.snp.makeConstraints { make in
            make.left.equalTo(self.logoswimsg.snp.right).offset(LAYOUT_MIN_UNIT)
            make.right.equalToSuperview().offset(-LAYOUT_MIN_UNIT)
            make.top.equalTo(self.logoswimsg)
        }
        
        self.yejskwContnsViwsk.snp.makeConstraints { make in
            make.left.equalTo(self.logoswimsg)
            make.right.equalTo(self.proswNameLasL)
            make.top.equalTo(self.logoswimsg.snp.bottom).offset(LAYOUT_MIN_UNIT * 2)
            make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 2)
        }
        
        self.stsuwjsLab.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 2)
            make.centerY.equalToSuperview()
        }
        
        self.stauswImgViws.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 2)
            make.verticalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refeshkAuthskwoModels(model: Opposed) {
        if let _ur_te = model.staying, let _ur = URL(string: _ur_te) {
            self.logoswimsg.setImageWith(_ur, options: YYWebImageOptions.setImageWithFadeAnimation)
        }
        
        self.proswNameLasL.text = model.gendered
        self.stsuwjsLab.text = model.locations == "1" ? APPLanguageInsTool.loadLanguage("auth_com") : APPLanguageInsTool.loadLanguage("auth_un")
        self.stauswImgViws.image = model.locations == "1" ? UIImage(named: "auths_comw") : UIImage(named: "unAuths")
    }
}
