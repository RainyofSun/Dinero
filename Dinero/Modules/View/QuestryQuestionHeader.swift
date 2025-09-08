//
//  QuestryQuestionHeader.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/8.
//

import UIKit

class QuestryQuestionHeader: UIControl {

    private lazy var bgViewsWkd: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor.hexStringColor(hexString: "#FF9900")
        view.corner(14)
        return view
    }()
    
    private lazy var sinswkejLb: UILabel = {
        let view = UILabel.buildNormalTextLabel(APPLanguageInsTool.loadLanguage("auth_qews"), t_color: UIColor.white, font: UIFont.systemFont(ofSize: 14))
        return view
    }()
    
    private lazy var downaksmwIms: UIImageView = UIImageView(image: UIImage(named: "list_fold"))
    
    init(frame: CGRect, isExpand: Bool) {
        super.init(frame: frame)
        
        self.reloadHeaderMdoes(isExpand: isExpand)
        self.addSubview(self.bgViewsWkd)
        self.bgViewsWkd.addSubview(self.sinswkejLb)
        self.addSubview(self.downaksmwIms)
        
        self.bgViewsWkd.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().offset(LAYOUT_MIN_UNIT * 3)
            make.height.equalTo(30)
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 5)
        }
        
        self.sinswkejLb.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 4)
            make.centerY.equalToSuperview()
        }
        
        self.downaksmwIms.snp.makeConstraints { make in
            make.centerY.equalTo(self.bgViewsWkd)
            make.right.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadHeaderMdoes(isExpand: Bool) {
        self.downaksmwIms.transform = !isExpand ? CGAffineTransform(rotationAngle: .pi/2) : .identity
    }
}
