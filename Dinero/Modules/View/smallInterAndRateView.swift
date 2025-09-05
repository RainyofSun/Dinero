//
//  smallInterAndRateView.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/5.
//

import UIKit

class smallInterAndRateView: UIView {

    private(set) lazy var leftLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#6D6B70"), font: UIFont.systemFont(ofSize: 14))
    private(set) lazy var rightLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#D40028"), font: UIFont.systemFont(ofSize: 16))

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.leftLab)
        self.addSubview(self.rightLab)
        
        self.leftLab.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.verticalEdges.equalToSuperview()
        }
        
        self.rightLab.snp.makeConstraints { make in
            make.centerY.right.equalToSuperview()
            make.height.equalTo(self.leftLab)
            make.left.greaterThanOrEqualTo(self.leftLab.snp.right).offset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
