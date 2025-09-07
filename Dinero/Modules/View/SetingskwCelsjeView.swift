//
//  SetingskwCelsjeView.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/6.
//

import UIKit

enum SettingMineStywlsj: String {
    case Reminder = "setting_skw"
    case Cancel = "setting_cance"
    case Logout = "setting_lot"
    
    func settingImg() -> String {
        switch self {
        case .Reminder:
            return "setting_remin"
        case .Cancel:
            return "acc_cancel"
        case .Logout:
            return "acc_sign_out"
        }
    }
}

class SetingskwCelsjeView: UIControl {

    open var ske: SettingMineStywlsj = SettingMineStywlsj.Reminder
    
    private lazy var leftImgshw: UIImageView = UIImageView(frame: CGRectZero)
    private lazy var nsmwklab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#3D3D3D"), font: UIFont.systemFont(ofSize: 16))
    private lazy var arrowkskImgView: UIImageView = UIImageView(image: UIImage(named: "list_arrow"))
    private(set) lazy var switchConslwl: UISwitch = UISwitch(frame: CGRectZero)
    
    init(frame: CGRect, style: SettingMineStywlsj) {
        super.init(frame: frame)
        
        ske = style
        self.arrowkskImgView.isHidden = style == SettingMineStywlsj.Reminder
        self.switchConslwl.isHidden = !self.arrowkskImgView.isHidden
        
        self.leftImgshw.image = UIImage(named: style.settingImg())
        self.nsmwklab.text = APPLanguageInsTool.loadLanguage(style.rawValue)
        
        self.backgroundColor = UIColor.hexStringColor(hexString: "#F6F8FC")
        self.corner(12)
        
        self.addSubview(self.leftImgshw)
        self.addSubview(self.nsmwklab)
        self.addSubview(self.arrowkskImgView)
        self.addSubview(self.switchConslwl)
        
        self.leftImgshw.snp.makeConstraints { make in
            make.size.equalTo(32)
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4)
            make.verticalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 4)
        }
        
        self.nsmwklab.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.leftImgshw.snp.right).offset(LAYOUT_MIN_UNIT * 2.5)
        }
        
        self.arrowkskImgView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 4)
        }
        
        self.switchConslwl.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(self.arrowkskImgView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
