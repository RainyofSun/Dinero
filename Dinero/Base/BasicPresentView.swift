//
//  BasicPresentViewController.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/3.
//

import UIKit

class BasicPresentView: UIView {
    
    private(set) lazy var contentView: UIImageView = {
        let bgImg = UIImage(named: "present")
        let resiceImg = bgImg?.resizableImage(withCapInsets: UIEdgeInsets.init(top: bgImg!.size.height * 0.6, left: 0, bottom: bgImg!.size.height * 0.7, right: 0), resizingMode: UIImage.ResizingMode.stretch)
        
        let view = UIImageView(image: resiceImg)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var closeBtn: UIButton = {
        let btn = UIButton(type: UIButton.ButtonType.custom)
        btn.setImage(UIImage(named: "login_close"), for: UIControl.State.normal)
        return btn
    }()
    
    private(set) lazy var confirmBtn: APPActivityButton = APPActivityButton.buildGradientLoadingButton(APPLanguageInsTool.loadLanguage("setting_confirm"))
    
    private(set) lazy var titleLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#D40028"), font: UIFont.interFont(size: 20, fontStyle: InterFontWeight.Medium))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.alpha = .zero
        self.backgroundColor = UIColor.init(white: 0, alpha: 0.3)
        
        self.buildPresentView()
        self.layoutPresentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildPresentView() {
        
        self.closeBtn.addTarget(self, action: #selector(closePresentView), for: UIControl.Event.touchUpInside)
        self.confirmBtn.addTarget(self, action: #selector(confirmClick(sender: )), for: UIControl.Event.touchUpInside)
        self.confirmBtn.corner(16)
        self.addSubview(self.closeBtn)
        self.addSubview(self.contentView)
        self.contentView.addSubview(self.titleLab)
        self.contentView.addSubview(self.confirmBtn)
    }
    
    func layoutPresentView() {
        self.contentView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.greaterThanOrEqualTo(200)
        }
        
        self.closeBtn.snp.makeConstraints { make in
            make.bottom.equalTo(self.contentView.snp.top).offset(-20)
            make.right.equalToSuperview().offset(-25)
            make.size.equalTo(25)
        }
        
        self.confirmBtn.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(50)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(jk_isIPhoneNotch ? -(10 + jk_kTabbarBottom) : -20)
        }
        
        self.titleLab.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4)
            make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4.5)
        }
    }
    
    @objc func closePresentView() {
        self.dismissPop()
    }
    
    @objc func confirmClick(sender: APPActivityButton) {
        
    }
    
    func showPresent() {
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1
        }
    }
    
    func dismissPop() {
        UIView.animate(withDuration: 0.3) {
            self.alpha = .zero
        } completion: { _ in
            self.removeFromSuperview()
        }
    }
}
