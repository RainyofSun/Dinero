//
//  ThirdMineswlViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit

class ThirdMineswlViewController: BasicViewController {

    private lazy var headerism: UIImageView = UIImageView(image: UIImage(named: "header"))
    private lazy var phoneslLab: UILabel = UILabel.buildNormalTextLabel("", t_color: Primary_Color_Black, font: UIFont.systemFont(ofSize: 16))
    private lazy var tipsView: CardTipImsjlerifView = CardTipImsjlerifView(frame: CGRectZero, style: CardTipStyle.Minswk)
    private lazy var listLab: UILabel = UILabel.buildNormalTextLabel(APPLanguageInsTool.loadLanguage("mine_fun"), t_color: Primary_Color_Black, font: UIFont.systemFont(ofSize: 16))
    private lazy var contentVIew: UIView = UIView(frame: CGRectZero)
    
    override func buildPageUI() {
        super.buildPageUI()
        
        self.title = APPLanguageInsTool.loadLanguage("mine_title")
        self.contentVIew.backgroundColor = .red
        
        self.basicScrollContentView.addSubview(self.headerism)
        self.basicScrollContentView.addSubview(self.phoneslLab)
        self.basicScrollContentView.addSubview(self.tipsView)
        self.basicScrollContentView.addSubview(self.listLab)
        self.basicScrollContentView.addSubview(self.contentVIew)
        
        self.headerism.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 5)
            make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 6 + jk_kNavFrameH)
            make.size.equalTo(57)
        }
        
        self.phoneslLab.snp.makeConstraints { make in
            make.centerY.equalTo(self.headerism)
            make.left.equalTo(self.headerism.snp.right).offset(LAYOUT_MIN_UNIT * 4)
            make.right.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 2)
        }
        
        self.tipsView.snp.makeConstraints { make in
            make.top.equalTo(self.headerism.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4)
            make.width.equalTo(jk_kScreenW - LAYOUT_MIN_UNIT * 8)
        }
        
        self.listLab.snp.makeConstraints { make in
            make.left.equalTo(self.tipsView)
            make.top.equalTo(self.tipsView.snp.bottom).offset(LAYOUT_MIN_UNIT * 4)
        }
        
        self.contentVIew.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalTo(self.view.width)
            make.top.equalTo(self.listLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 2.5)
            make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT)
            make.height.greaterThanOrEqualTo(200)
        }
    }

}
