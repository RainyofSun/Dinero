//
//  SmallCardPlishelwTableViewCell.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/5.
//

import UIKit

class SmallCardPlishelwTableViewCell: UITableViewCell {

    private lazy var cellContentView: GradientColorView = {
        let view = GradientColorView(frame: CGRectZero)
        view.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#FFFCF0"), UIColor.hexStringColor(hexString: "#FEFFE5")], gradientStyle: GradientDirectionStyle.leftToRight)
        view.isUserInteractionEnabled = true
        view.corner(15)
        return view
    }()
    
    private lazy var infoLabsk: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#FFF6CA")
        view.corner(10)
        return view
    }()
    
    private lazy var tipslw1: smallInterAndRateView = smallInterAndRateView(frame: CGRectZero)
    private lazy var tipslw2: smallInterAndRateView = smallInterAndRateView(frame: CGRectZero)
    private lazy var tipslw3: smallInterAndRateView = smallInterAndRateView(frame: CGRectZero)
    
    private lazy var logoImgView: UIImageView = {
        let view = UIImageView(frame: CGRectZero)
        view.corner(4)
        return view
    }()
    
    private lazy var nameskieLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.black, font: UIFont.systemFont(ofSize: 12))
    private lazy var applyBtn: APPActivityButton = {
        let view = APPActivityButton.buildGradientLoadingButton("")
        view.corner(6)
        view.setTitleColor(UIColor.white, for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        self.contentView.addSubview(self.cellContentView)
        self.cellContentView.addSubview(self.infoLabsk)
        self.infoLabsk.addSubview(self.tipslw1)
        self.infoLabsk.addSubview(self.tipslw2)
        self.infoLabsk.addSubview(self.tipslw3)
        self.cellContentView.addSubview(self.logoImgView)
        self.cellContentView.addSubview(self.nameskieLab)
        self.cellContentView.addSubview(self.applyBtn)
        
        self.cellContentView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 4)
            make.verticalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 2)
        }
        
        self.infoLabsk.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 2.5)
            make.verticalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 2)
//            make.width.equalToSuperview().multipliedBy(0.6)
            make.right.lessThanOrEqualTo(self.applyBtn.snp.left).offset(-LAYOUT_MIN_UNIT * 2)
        }
        
        self.tipslw1.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 2)
            make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 3)
        }
        
        self.tipslw2.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.tipslw1)
            make.top.equalTo(self.tipslw1.snp.bottom).offset(LAYOUT_MIN_UNIT * 1.5)
        }
        
        self.tipslw3.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.tipslw2)
            make.top.equalTo(self.tipslw2.snp.bottom).offset(LAYOUT_MIN_UNIT * 1.5)
            make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 1.5)
        }
        
        self.applyBtn.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 3)
            make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 3.5)
            make.height.equalTo(30)
            make.width.greaterThanOrEqualTo(85)
        }
        
        self.nameskieLab.snp.makeConstraints { make in
            make.centerX.equalTo(self.applyBtn)
            make.bottom.equalTo(self.applyBtn.snp.top).offset(-LAYOUT_MIN_UNIT)
            make.width.lessThanOrEqualTo(80)
        }
        
        self.logoImgView.snp.makeConstraints { make in
            make.centerX.equalTo(self.nameskieLab)
            make.bottom.equalTo(self.nameskieLab.snp.top).offset(-LAYOUT_MIN_UNIT * 2)
            make.size.equalTo(32)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refreshSkdlwCellSojwkc(model: Katz) {
        self.tipslw1.leftLab.text = model.seth
        self.tipslw1.rightLab.text = model.taylor
        self.tipslw3.leftLab.text = model.amelia
        self.tipslw3.rightLab.text = model.sanders
        self.tipslw2.leftLab.text = model.dan
        self.tipslw2.rightLab.text = model.haviland
        if let _url = model.jhr, let _u = URL(string: _url) {
            self.logoImgView.setImageWith(_u, options: YYWebImageOptions.setImageWithFadeAnimation)
        }
        self.nameskieLab.text = model.pmc
        self.applyBtn.setTitle(model.lowell, for: UIControl.State.normal)
    }
}
