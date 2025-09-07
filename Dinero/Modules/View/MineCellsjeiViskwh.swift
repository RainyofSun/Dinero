//
//  MineCellsjeiViskwh.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/5.
//

import UIKit

class MineCellsjeiViskwh: UICollectionViewCell {

    open var jumpUrl: String?
    
    private lazy var imgsjeVisk: UIImageView = UIImageView(frame: CGRectZero)
    private lazy var titleSkwLa: UILabel = UILabel.buildNormalTextLabel("", t_color: Primary_Color_Black, font: UIFont.systemFont(ofSize: 16))
    private lazy var arrowsljImg: UIImageView = UIImageView(image: UIImage(named: "list_arrow"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.corner(12)
        self.jk.addShadow(shadowColor: UIColor.black.withAlphaComponent(0.6), shadowOffset: CGSize(width: 0, height: 4), shadowOpacity: 9)
        
        self.addSubview(self.imgsjeVisk)
        self.addSubview(self.titleSkwLa)
        self.addSubview(self.arrowsljImg)
        
        self.imgsjeVisk.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 5)
            make.size.equalTo(36)
        }
        
        self.arrowsljImg.snp.makeConstraints { make in
            make.centerY.equalTo(self.imgsjeVisk)
            make.right.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 4)
        }
        
        self.titleSkwLa.snp.makeConstraints { make in
            make.top.equalTo(self.imgsjeVisk.snp.bottom).offset(LAYOUT_MIN_UNIT)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 4.5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refreshMinsleCells(model: MineTransition) {
        if let _ur_te = model.maria {
            if _ur_te.hasPrefix("http"), let _ur = URL(string: _ur_te) {
                self.imgsjeVisk.setImageWith(_ur, options: YYWebImageOptions.setImageWithFadeAnimation)
            } else {
                self.imgsjeVisk.image = UIImage(named: _ur_te)
            }
        }
        
        self.titleSkwLa.text = model.gendered
        self.jumpUrl = model.claude
    }
}
