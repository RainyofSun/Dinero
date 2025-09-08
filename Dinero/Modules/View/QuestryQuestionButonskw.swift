//
//  QuestryQuestionButonskw.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/8.
//

import UIKit

class QuestryQuestionButonskw: UIControl {
    
    open var marks: Gov?
    
    private(set) lazy var tilsLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#202020"), font: UIFont.systemFont(ofSize: 14))
    private lazy var selswkMainsImf: UIImageView = {
        let view = UIImageView(image: UIImage(named: "eiwsRisk"))
        view.isHidden = true
        return view
    }()

    override var isSelected: Bool {
        didSet {
            self.selswkMainsImf.isHidden = !isSelected
            self.layer.borderColor = isSelected ? Primary_Color1.cgColor : UIColor.clear.cgColor
            if isSelected {
                print("----2-2-")
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.hexStringColor(hexString: "#FFF6CA")
        self.corner(22)
        self.layer.borderWidth = 1
        
        self.addSubview(self.tilsLab)
        self.addSubview(self.selswkMainsImf)
        
        self.tilsLab.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 5)
        }
        
        self.selswkMainsImf.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 3)
            make.right.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
