//
//  SinfsltesgPicnskerView.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/10.
//

import UIKit
import BRPickerView

class SinfsltesgPicnskerView: BasicPresentView {

    open var seleshwha_goskw: Gov?
    
    private lazy var suwjeypickerView: BRTextPickerView = {
        let _pickView = BRTextPickerView(pickerMode: BRTextPickerMode.componentSingle)
        let style: BRPickerStyle = BRPickerStyle()
        style.hiddenDoneBtn = true
        style.hiddenCancelBtn = true
        style.hiddenTitleLine = true
        style.pickerColor = .clear
        style.pickerTextColor = UIColor.hexStringColor(hexString: "#999999")
        style.pickerTextFont = UIFont.interFont(size: 14, fontStyle: InterFontWeight.Medium)
        style.selectRowTextColor = Primary_Color1
        style.selectRowTextFont = UIFont.interFont(size: 14, fontStyle: InterFontWeight.Medium)
        style.pickerHeight = 250
        _pickView.pickerStyle = style
        return _pickView
    }()
    
    private lazy var pwoaskwerContentView: UIView = {
        let voew = UIView(frame: CGRect(x: 0, y: 0, width: jk_kScreenW - LAYOUT_MIN_UNIT * 8, height: 250))
        voew.backgroundColor = .clear
        return voew
    }()
    
    override func buildPresentView() {
        super.buildPresentView()
        self.titleLab.text = APPLanguageInsTool.loadLanguage("address_sel")
        
        self.contentView.addSubview(self.pwoaskwerContentView)
        
        self.suwjeypickerView.singleChangeBlock = {[weak self] (mods: BRTextModel?, ids: Int) in
            self?.seleshwha_goskw = Gov()
            self?.seleshwha_goskw?.lawrence = mods?.code
            self?.seleshwha_goskw?.rans = mods?.text
        }
        
        self.suwjeypickerView.singleResultBlock = {[weak self] (mods: BRTextModel?, ids: Int) in
            self?.seleshwha_goskw = Gov()
            self?.seleshwha_goskw?.lawrence = mods?.code
            self?.seleshwha_goskw?.rans = mods?.text
        }
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.pwoaskwerContentView.snp.makeConstraints { make in
            make.top.equalTo(self.titleLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 4)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(250)
            make.bottom.equalTo(self.confirmBtn.snp.top).offset(-LAYOUT_MIN_UNIT * 4)
        }
    }
    
    override func confirmClick(sender: APPActivityButton) {
        self.suwjeypickerView.doneBlock?()
        super.confirmClick(sender: sender)
    }
    
    func reloadSingsketswjajMods(moslw: [Gov]) {
        var sowksm_arrsuq: [[String: String]] = []
        
        moslw.forEach { item in
            if let _ke = item.lawrence, let _vsm = item.rans {
                sowksm_arrsuq.append(["code": _ke, "text": _vsm])
            }
        }
        
        self.suwjeypickerView.dataSourceArr = NSArray.br_modelArray(withJson: sowksm_arrsuq, mapper: nil)
        self.suwjeypickerView.addPicker(to: self.pwoaskwerContentView)
    }
}
