//
//  FlashCellView.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/3.
//

import UIKit

class FlashCellView: UIView {

    private lazy var grientView = {
        let view = GradientColorView()
        view.buildGradientWithColors(gradientColors: [UIColor.hexStringColor(hexString: "#FFBFCB"), UIColor.hexStringColor(hexString: "#FFF2EF"),], gradientStyle: GradientDirectionStyle.topToBottom)
        return view
    }()
    
    private lazy var tipImageView: UIImageView = UIImageView(image: UIImage(named: "guide_one"))
    private lazy var tipLab: UILabel = UILabel.buildNormalTextLabel(APPLanguageInsTool.loadLanguage("guide_one"), t_color: UIColor.black, font: UIFont.interFont(size: 16, fontStyle: InterFontWeight.Regular_SemiBold_Italic))
                                                                    
    private lazy var lineImageView: UIImageView = UIImageView(image: UIImage(named: "guide_one_line"))
    
    init(frame: CGRect, isFirst: Bool = true) {
        super.init(frame: frame)
        
        if !isFirst {
            self.tipImageView.image = UIImage(named: "guide_two")
            self.tipLab.text = APPLanguageInsTool.loadLanguage("guide_otwo")
            self.lineImageView.image = UIImage(named: "guide_two_line")
        }
        
        self.addSubview(self.grientView)
        self.addSubview(self.tipImageView)
        self.addSubview(self.tipLab)
        self.addSubview(self.lineImageView)
        
        self.grientView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.tipImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
        }
        
        self.tipLab.snp.makeConstraints { make in
            make.top.equalTo(self.tipImageView.snp.bottom)
            make.horizontalEdges.equalToSuperview().inset(30)
        }
        
        self.lineImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.tipLab.snp.bottom).offset(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refreshText(_ isFirst: Bool) {
        self.tipLab.text = APPLanguageInsTool.loadLanguage(isFirst ? "guide_one" : "guide_otwo")
    }
    
}
