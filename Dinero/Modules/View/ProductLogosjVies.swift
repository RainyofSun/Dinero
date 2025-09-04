//
//  ProductLogosjVies.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/4.
//

import UIKit

class ProductLogosjVies: UIView {

    private lazy var pImgView: UIImageView = UIImageView(frame: CGRectZero)
    private lazy var pLabs: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#404040"), font: UIFont.interFont(size: 20, fontStyle: InterFontWeight.Bold))

    init(frame: CGRect, logoSize: CGSize = CGSize(width: 33, height: 33)) {
        super.init(frame: frame)
        self.addSubview(self.pImgView)
        self.addSubview(self.pLabs)
        self.pImgView.corner(4)
        
        self.pImgView.snp.makeConstraints { make in
            make.size.equalTo(logoSize)
            make.left.verticalEdges.equalToSuperview()
        }
        
        self.pLabs.snp.makeConstraints { make in
            make.centerY.equalTo(self.pImgView)
            make.left.equalTo(self.pImgView.snp.right).offset(LAYOUT_MIN_UNIT)
            make.right.equalToSuperview().offset(-LAYOUT_MIN_UNIT)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProducsImgUrl(url: String, logoName name: String?, textFont font: UIFont = UIFont.interFont(size: 20, fontStyle: InterFontWeight.Bold)) {
        if let _url = URL(string: url) {
            self.pImgView.setImageWith(_url, options: YYWebImageOptions.setImageWithFadeAnimation)
        }
        self.pLabs.text = name
        self.pLabs.font = font
    }
}
