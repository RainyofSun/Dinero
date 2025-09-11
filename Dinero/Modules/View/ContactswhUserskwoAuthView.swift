//
//  ContactswhUserskwoAuthView.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/11.
//

import UIKit

class ContactswhUserskwoAuthView: UIView {

    weak open var unitDelelsjwu: InfoUnitProtoslwpProtocl?
    open var ywhstisTupe: (cacheKeu:String?, choise: [Gov]?)?
    
    private lazy var dotskwk: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#F79E1B")
        view.corner(6)
        return view
    }()
    
    private lazy var toplabs: UILabel = UILabel.buildNormalTextLabel("", t_color: Primary_Color_Black, font: UIFont.interFont(size: 16, fontStyle: InterFontWeight.Medium))
    
    private(set) lazy var titleLans: UILabel = UILabel.buildNormalTextLabel("", t_color: Primary_Color_Black, font: UIFont.interFont(size: 15, fontStyle: InterFontWeight.Regular))
    private(set) lazy var inputTextFiles: ForbidActionTextFiled = {
        let view = ForbidActionTextFiled(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#FFF6CA")
        view.corner(22)
        view.borderStyle = .none
        view.layer.borderColor = Primary_Color1.cgColor
        view.layer.borderWidth = 1
        view.textColor = Primary_Color_Black
        view.font = UIFont.interFont(size: 14, fontStyle: InterFontWeight.Regular)
        let imgView = UIImageView(image: UIImage(named: "list_arrow"))
        view.rightView = imgView
        view.rightViewMode = .always
        return view
    }()
    
    private lazy var subtitleLans: UILabel = UILabel.buildNormalTextLabel("", t_color: Primary_Color_Black, font: UIFont.interFont(size: 15, fontStyle: InterFontWeight.Regular))
    private lazy var subinputTextFiles: ForbidActionTextFiled = {
        let view = ForbidActionTextFiled(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#FFF6CA")
        view.corner(22)
        view.borderStyle = .none
        view.layer.borderColor = Primary_Color1.cgColor
        view.layer.borderWidth = 1
        view.textColor = Primary_Color_Black
        view.font = UIFont.interFont(size: 14, fontStyle: InterFontWeight.Regular)
        let imgView = UIImageView(image: UIImage(named: "list_arrow"))
        view.rightView = imgView
        view.rightViewMode = .always
        return view
    }()
    
    private(set) var chanspwin: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        self.corner(16)
        
        self.subtitleLans.textAlignment = .left
        self.titleLans.textAlignment = .left
        self.toplabs.textAlignment = .left
        
        self.inputTextFiles.delegate = self
        self.subinputTextFiles.delegate = self
        
        self.addSubview(self.dotskwk)
        self.addSubview(self.toplabs)
        self.addSubview(self.titleLans)
        self.addSubview(self.inputTextFiles)
        self.addSubview(self.subtitleLans)
        self.addSubview(self.subinputTextFiles)
        
        self.dotskwk.snp.makeConstraints { make in
            make.centerY.equalTo(self.toplabs)
            make.left.equalTo(self.inputTextFiles).offset(LAYOUT_MIN_UNIT * 3)
            make.size.equalTo(12)
        }
        
        self.toplabs.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4)
            make.left.equalTo(self.dotskwk.snp.right).offset(LAYOUT_MIN_UNIT * 3)
        }
        
        self.titleLans.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 7)
            make.top.equalTo(self.toplabs.snp.bottom).offset(LAYOUT_MIN_UNIT * 2.5)
        }
        
        self.inputTextFiles.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(self.titleLans)
            make.top.equalTo(self.titleLans.snp.bottom).offset(LAYOUT_MIN_UNIT * 2.5)
            make.height.equalTo(53)
        }
        
        self.subtitleLans.snp.makeConstraints { make in
            make.top.equalTo(self.inputTextFiles.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.horizontalEdges.equalTo(self.inputTextFiles)
        }
        
        self.subinputTextFiles.snp.makeConstraints { make in
            make.horizontalEdges.height.equalTo(self.inputTextFiles)
            make.top.equalTo(self.subtitleLans.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 4)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloaskdContastwjejsViews(mskw: StatewideItem) {
        self.ywhstisTupe = ("", mskw.gov)
        
        self.toplabs.text = mskw.gendered
        self.titleLans.text = mskw.denied
        self.subtitleLans.text = mskw.transgender
        
        if let _places = mskw.fired {
            self.inputTextFiles.attributedPlaceholder = NSAttributedString(string: _places, attributes: [.foregroundColor: Primary_Color_Black.withAlphaComponent(0.6), .font: UIFont.interFont(size: 14, fontStyle: InterFontWeight.Regular)])
        }
        
        if let _places = mskw.bisexual {
            self.subinputTextFiles.attributedPlaceholder = NSAttributedString(string: _places, attributes: [.foregroundColor: Primary_Color_Black.withAlphaComponent(0.6), .font: UIFont.interFont(size: 14, fontStyle: InterFontWeight.Regular)])
        }
        
        if let _reslw = mskw.harassed, let _gov = mskw.gov {
            for item in _gov {
                if _reslw == item.lawrence {
                    self.inputTextFiles.text = item.rans
                    break
                }
            }
        }
        
        if let _na = mskw.rans, let _phosw = mskw.promotions, !_na.isEmpty && !_phosw.isEmpty {
            self.subinputTextFiles.text = "\(_na)-\(_phosw)"
        }
    }
    
    func resjwkeiUserPhoe(phone: String?) {
        if let _r = phone {
            self.subinputTextFiles.text = _r
        }
    }
    
    func reskwiUserrelauw(reaiw: String?) {
        if let _w = reaiw {
            self.inputTextFiles.text = _w
        }
    }
}

extension ContactswhUserskwoAuthView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.chanspwin = textField == self.inputTextFiles
        self.unitDelelsjwu?.toushckawUniswInfoskw(itemiew: self)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.chanspwin = textField == self.inputTextFiles
        self.unitDelelsjwu?.didsWmswEnddiejng(itemViw: self, inputVws: textField.text)
    }
}
