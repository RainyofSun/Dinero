//
//  dotTextLabel.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/3.
//

import UIKit

class dotTextLabel: UIView {

    private lazy var dotView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#F79E1B")
        view.corner(6)
        return view
    }()
    
    private(set) lazy var textsioLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#333333"), font: UIFont.interFont(size: 16, fontStyle: InterFontWeight.Medium))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.dotView)
        self.addSubview(self.textsioLab)
        
        self.dotView.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.size.equalTo(12)
        }
        
        self.textsioLab.snp.makeConstraints { make in
            make.left.equalTo(self.dotView.snp.right).offset(LAYOUT_MIN_UNIT)
            make.top.equalTo(self.dotView)
            make.right.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
