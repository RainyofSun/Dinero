//
//  ChanPineInfoViwsj.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/8.
//

import UIKit

enum ChanPineInfoSytwjType: String {
    case LiXi = "auth_rate"
    case Time = "auth_day"
}

class ChanPineInfoViwsj: UIView {

    private lazy var iconSkwmVi: UIImageView = UIImageView(frame: CGRectZero)
    private(set) lazy var lsnejwVisLab: UILabel = UILabel.buildNormalTextLabel("", t_color: Primary_Color_Black, font: UIFont.systemFont(ofSize: 14))
    private(set) lazy var valsueLas: UILabel = UILabel.buildNormalTextLabel("", t_color: Primary_Color_Black, font: UIFont.systemFont(ofSize: 18))
    
    init(frame: CGRect, style: ChanPineInfoSytwjType) {
        super.init(frame: frame)
        
        self.iconSkwmVi.image = UIImage(named: style.rawValue)
        
        self.addSubview(self.iconSkwmVi)
        self.addSubview(self.lsnejwVisLab)
        self.addSubview(self.valsueLas)
        
        self.iconSkwmVi.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 5)
            make.top.equalToSuperview()
        }
        
        self.lsnejwVisLab.snp.makeConstraints { make in
            make.centerY.equalTo(self.iconSkwmVi)
            make.left.equalTo(self.iconSkwmVi.snp.right).offset(LAYOUT_MIN_UNIT * 1.5)
        }
        
        self.valsueLas.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.iconSkwmVi.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 3)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
