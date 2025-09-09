//
//  BirthdayPsokeViwjsjVi.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/10.
//

import UIKit
import BRPickerView

class BirthdayPsokeViwjsjVi: BasicPresentView {

    open var closeClosure: ((BasicPresentView) -> Void)?
    
    private lazy var timePickerView: BRDatePickerView = {
        let picker = BRDatePickerView(frame: CGRectZero)
        picker.minDate = NSDate.br_setYear(1949, month: 3, day: 12)
        picker.maxDate = NSDate.now
        picker.pickerMode = .YMD
        let pickerStyle = BRPickerStyle()
        pickerStyle.hiddenDoneBtn = true
        pickerStyle.hiddenCancelBtn = true
        pickerStyle.hiddenTitleLine = true
        pickerStyle.pickerColor = .clear
        pickerStyle.pickerTextColor = UIColor.hexStringColor(hexString: "#999999")
        pickerStyle.pickerTextFont = UIFont.interFont(size: 14, fontStyle: InterFontWeight.Medium)
        pickerStyle.selectRowTextColor = Primary_Color1
        pickerStyle.selectRowTextFont = UIFont.interFont(size: 14, fontStyle: InterFontWeight.Medium)
        pickerStyle.pickerHeight = 305
        picker.pickerStyle = pickerStyle
        
        return picker
    }()
    
    private lazy var pickerContentView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: jk_kScreenW - LAYOUT_MIN_UNIT * 8, height: 305))
    private(set) var selectedDate: String?
    
    override func buildPresentView() {
        super.buildPresentView()
        
        self.titleLab.text = APPLanguageInsTool.loadLanguage("time_tip")
        self.contentView.addSubview(self.pickerContentView)
        self.timePickerView.addPicker(to: self.pickerContentView)
        
        self.timePickerView.resultBlock = {[weak self] (selectDate: Date?, selectValue: String?) in
            guard let _date = selectDate else {
                return
            }
            self?.selectedDate = NSDate.br_string(from: _date, dateFormat: "yyyy-MM-dd")
        }
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.timePickerView.snp.makeConstraints { make in
            make.top.equalTo(self.titleLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 2)
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 6)
            make.height.equalTo(305)
            make.bottom.equalTo(self.confirmBtn.snp.top).offset(-LAYOUT_MIN_UNIT * 5)
        }
    }
    
    override func confirmClick(sender: APPActivityButton) {
        self.timePickerView.doneBlock?()
        super.confirmClick(sender: sender)
    }
    
    override func closePresentView() {
        super.closePresentView()
        self.closeClosure?(self)
    }
}
