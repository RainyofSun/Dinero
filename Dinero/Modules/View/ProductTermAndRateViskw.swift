//
//  ProductTermAndRateViskw.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/5.
//

import UIKit

class ProductTermAndRateViskw: UIView {

    private lazy var consjakwiLab: UILabel = {
        let view = UILabel.init(frame: CGRectZero)
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.hexStringColor(hexString: "#FEECE0")
        self.corner(11)
        self.jk.addShadow(shadowColor: UIColor.hexStringColor(hexString: "#D4778D", alpha: 0.5), shadowOffset: CGSize(width: 0, height: 4), shadowOpacity: 4)
        
        self.addSubview(self.consjakwiLab)
        self.consjakwiLab.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 4)
            make.verticalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 3)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func productInfoAttributeStdks(atts: NSAttributedString) {
        self.consjakwiLab.attributedText = atts
    }
}
