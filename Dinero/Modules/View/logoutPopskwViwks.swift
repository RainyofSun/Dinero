//
//  logoutPopskwViwks.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/6.
//

import UIKit

class logoutPopskwViwks: BasicPresentView {

    private lazy var setTipslwk: UILabel = UILabel.buildNormalTextLabel(APPLanguageInsTool.loadLanguage("setting_lot_alert"), t_color: Primary_Color_Black, font: UIFont.interFont(size: 16, fontStyle: InterFontWeight.Regular))
    private lazy var amountskdLab: JianBianLab = {
        let view = JianBianLab(frame: CGRectZero)
        view.font = UIFont.interFont(size: 64, fontStyle: InterFontWeight.Regular_Black_Italic)
        view.strokeColor = UIColor.white
        view.gradientColors = [UIColor.hexStringColor(hexString: "#D24D5D"), UIColor.hexStringColor(hexString: "#5C1C35")]
        view.strokeWidth = 6.0
        return view
    }()
    
    override func buildPresentView() {
        super.buildPresentView()
        self.titleLab.text = APPLanguageInsTool.loadLanguage("setting_lot")
        
        self.amountskdLab.text = "85,000"
        
        self.contentView.addSubview(self.setTipslwk)
        self.contentView.addSubview(self.amountskdLab)
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        self.setTipslwk.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 4)
            make.top.equalTo(self.titleLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 5)
        }
        
        self.amountskdLab.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.setTipslwk.snp.bottom).offset(LAYOUT_MIN_UNIT)
            make.bottom.equalTo(self.confirmBtn.snp.top).offset(-LAYOUT_MIN_UNIT * 2)
        }
    }
}
