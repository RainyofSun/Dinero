//
//  CisyeyPisnkerTableViewCell.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/12.
//

import UIKit

class CisyeyPisnkerTableViewCell: UITableViewCell {

    private lazy var coswtentVew: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = .clear
        view.corner(4)
        view.isHidden = true
        return view
    }()
    
    private(set) lazy var cislwLab: UILabel = UILabel.buildNormalTextLabel("", t_color: Primary_Color_Black, font: UIFont.interFont(size: 14, fontStyle: InterFontWeight.Regular))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.contentView.addSubview(self.coswtentVew)
        self.contentView.addSubview(self.cislwLab)
        
        self.coswtentVew.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 6)
            make.verticalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT)
        }
        
        self.cislwLab.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 8)
            make.verticalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.coswtentVew.isHidden = !selected
        self.coswtentVew.backgroundColor = selected ? UIColor.hexStringColor(hexString: "#FFF6CA") : .clear
        self.cislwLab.textColor = selected ? Primary_Color1 : Primary_Color_Black
    }
}
