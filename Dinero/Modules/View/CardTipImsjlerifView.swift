//
//  CardTipImsjlerifView.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/5.
//

import UIKit

enum CardTipStyle: String {
    case Minswk = "mine_img"
    case Ordeskw = "order_img"
    case Settskw = "setting_img"
    
    func tipsText() -> String {
        switch self {
        case .Minswk:
            return "mine_tip"
        case .Ordeskw:
            return "order_tip"
        case .Settskw:
            return "setting_tip"
        }
    }
    
    func tipsBgColor() -> UIColor {
        switch self {
        case .Minswk:
            return UIColor.hexStringColor(hexString: "#F23055")
        case .Ordeskw:
            return UIColor.hexStringColor(hexString: "#FFBFCB")
        case .Settskw:
            return UIColor.hexStringColor(hexString: "#FFBFCB")
        }
    }
}

class CardTipImsjlerifView: UIView {

    private lazy var imgView: UIImageView = UIImageView(frame: CGRectZero)
    private(set) lazy var colorLab: GradientTextLabel = {
        let view = GradientTextLabel(frame: CGRectZero)
        view.numberOfLines = .zero
        return view
    }()

    init(frame: CGRect, style: CardTipStyle) {
        super.init(frame: frame)
        
        self.corner(15)
        self.backgroundColor = style.tipsBgColor()
        self.colorLab.text = APPLanguageInsTool.loadLanguage(style.tipsText())
        self.imgView.image = UIImage(named: style.rawValue)
        self.addSubview(self.imgView)
        self.addSubview(self.colorLab)
        
        self.imgView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 2)
        }
        
        self.colorLab.snp.makeConstraints { make in
            make.left.equalTo(self.imgView.snp.right).offset(LAYOUT_MIN_UNIT * 2)
            make.right.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 2)
            make.verticalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 3)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
