//
//  CardUsesidnwIfosKsuwjPoseiView.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/9.
//

import UIKit

class CardUsesidnwIfosKsuwjPoseiView: BasicPresentView {

    open var infoPasjwsDicts: [String: String] = ["lawrence":"11"]
    
    private lazy var nameSdjws: CardCommoenswitemViskw = CardCommoenswitemViskw(frame: CGRectZero, inputsYwhdk: RenZhengElemeent.RZ_Text)
    private lazy var numbswjSdjws: CardCommoenswitemViskw = CardCommoenswitemViskw(frame: CGRectZero, inputsYwhdk: RenZhengElemeent.RZ_Text)
    private lazy var birthdwksSdjws: CardCommoenswitemViskw = CardCommoenswitemViskw(frame: CGRectZero, inputsYwhdk: RenZhengElemeent.RZ_Enum)
    private lazy var bsotTipsLan: UILabel = UILabel.buildNormalTextLabel(APPLanguageInsTool.loadLanguage("info_confirm_bto"), t_color: UIColor.hexStringColor(hexString: "#FE6337"), font: UIFont.systemFont(ofSize: 13))
    
    override func buildPresentView() {
        super.buildPresentView()
        
        self.titleLab.text = APPLanguageInsTool.loadLanguage("info_confirm_tip")
        self.nameSdjws.reloaskwTiels(titles: APPLanguageInsTool.loadLanguage("info_confirm_name"), inspwText: nil)
        self.numbswjSdjws.reloaskwTiels(titles: APPLanguageInsTool.loadLanguage("info_confirm_id"), inspwText: nil)
        self.birthdwksSdjws.reloaskwTiels(titles: APPLanguageInsTool.loadLanguage("info_confirm_bir"), inspwText: nil)
        
        self.nameSdjws.unitDelelsjwu = self
        self.numbswjSdjws.unitDelelsjwu = self
        self.birthdwksSdjws.unitDelelsjwu = self
        
        self.contentView.addSubview(self.nameSdjws)
        self.contentView.addSubview(self.numbswjSdjws)
        self.contentView.addSubview(self.birthdwksSdjws)
        self.contentView.addSubview(self.bsotTipsLan)
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.nameSdjws.snp.makeConstraints { make in
            make.top.equalTo(self.titleLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 4.5)
            make.horizontalEdges.equalToSuperview()
        }
        
        self.numbswjSdjws.snp.makeConstraints { make in
            make.top.equalTo(self.nameSdjws.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.horizontalEdges.equalToSuperview()
        }
        
        self.birthdwksSdjws.snp.makeConstraints { make in
            make.top.equalTo(self.numbswjSdjws.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.horizontalEdges.equalToSuperview()
        }
        
        self.bsotTipsLan.snp.makeConstraints { make in
            make.top.equalTo(self.birthdwksSdjws.snp.bottom).offset(LAYOUT_MIN_UNIT * 3.5)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(self.confirmBtn.snp.top).offset(-LAYOUT_MIN_UNIT * 3.5)
        }
    }
    
    func refeshUsjeriDksInfos(model: CardAuthResulwdMowsl) {
        if let _name = model.june {
            self.nameSdjws.reloaskwTiels(titles: nil, inspwText: _name)
            self.nameSdjws.unttisTupe = ("rans", nil)
            self.infoPasjwsDicts["rans"] = _name
        }
        
        if let _bir = model.protections {
            self.birthdwksSdjws.reloaskwTiels(titles: nil, inspwText: _bir)
            self.birthdwksSdjws.unttisTupe = ("protections", nil)
            self.infoPasjwsDicts["protections"] = _bir
        }
        
        if let _ids = model.administration {
            self.numbswjSdjws.reloaskwTiels(titles: nil, inspwText: _ids)
            self.numbswjSdjws.unttisTupe = ("dei", nil)
            self.infoPasjwsDicts["dei"] = _ids
        }
    }
}

extension CardUsesidnwIfosKsuwjPoseiView: InfoUnitProtoslwpProtocl {
    func toushckawUniswInfoskw(itemiew: CardCommoenswitemViskw) {
        if itemiew.renzhensjakwStyle == .RZ_Enum {
            // 生日
        }
    }
    
    func didsWmswEnddiejng(itemViw: CardCommoenswitemViskw, inputVws: String?) {
        guard let _kes = itemViw.unttisTupe?.cacheKeu else {
            return
        }
        
        self.infoPasjwsDicts[_kes] = inputVws
    }
}
