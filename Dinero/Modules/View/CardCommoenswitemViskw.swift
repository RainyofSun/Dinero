//
//  CardCommoenswitemViskw.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/9.
//

import UIKit

protocol InfoUnitProtoslwpProtocl: AnyObject {
    func toushckawUniswInfoskw(itemiew: CardCommoenswitemViskw)
    func didsWmswEnddiejng(itemViw: CardCommoenswitemViskw, inputVws: String?)
}

class CardCommoenswitemViskw: UIView {

    weak open var unitDelelsjwu: InfoUnitProtoslwpProtocl?
    open var unttisTupe: (cacheKeu:String, choise: [TYXuanZeModel]?)?
    
    private lazy var dotskwk: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#F79E1B")
        view.corner(6)
        return view
    }()
    
    private lazy var titleLans: UILabel = UILabel.buildNormalTextLabel("", t_color: Primary_Color_Black, font: UIFont.interFont(size: 16, fontStyle: InterFontWeight.Medium))
    private lazy var inputTextFiles: ForbidActionTextFiled = {
        let view = ForbidActionTextFiled(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#FFF6CA")
        view.corner(22)
        view.borderStyle = .none
        view.layer.borderColor = Primary_Color1.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private(set) var renzhensjakwStyle: RenZhengElemeent = RenZhengElemeent.RZ_Enum
    
    init(frame: CGRect, inputsYwhdk: RenZhengElemeent) {
        super.init(frame: frame)
        self.renzhensjakwStyle = inputsYwhdk
        
        self.inputTextFiles.delegate = self
        self.titleLans.textAlignment = .left
        
        self.addSubview(self.dotskwk)
        self.addSubview(self.titleLans)
        self.addSubview(self.inputTextFiles)
        
        if inputsYwhdk == RenZhengElemeent.RZ_Enum {
            let imgView = UIImageView(image: UIImage(named: "list_arrow"))
            self.inputTextFiles.rightView = imgView
            self.inputTextFiles.rightViewMode = .always
        }
        
        self.dotskwk.snp.makeConstraints { make in
            make.centerY.equalTo(self.titleLans)
            make.left.equalTo(self.inputTextFiles).offset(LAYOUT_MIN_UNIT * 3)
            make.size.equalTo(12)
        }
        
        self.titleLans.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalTo(self.dotskwk.snp.right).offset(LAYOUT_MIN_UNIT * 3)
        }
        
        self.inputTextFiles.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 7)
            make.top.equalTo(self.titleLans.snp.bottom).offset(LAYOUT_MIN_UNIT * 2.5)
            make.height.equalTo(53)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloaskwTiels(titles: String?, inspwText tex: String?) {
        if let _t = titles {
            self.titleLans.text = _t
        }
        
        if let _ws = tex {
            self.inputTextFiles.text = _ws
        }
    }
}

extension CardCommoenswitemViskw: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.unitDelelsjwu?.toushckawUniswInfoskw(itemiew: self)
        return self.renzhensjakwStyle == .RZ_Text
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.unitDelelsjwu?.didsWmswEnddiejng(itemViw: self, inputVws: textField.text)
    }
}
