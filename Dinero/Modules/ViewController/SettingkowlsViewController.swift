//
//  SettingkowlsViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/4.
//

import UIKit

class SettingkowlsViewController: BasicViewController {

    private lazy var logoImsh: UIImageView = UIImageView(image: UIImage(named: "logo"))
    private lazy var appNameLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#404040"), font: UIFont.interFont(size: 20, fontStyle: InterFontWeight.Extra_Bold))
    private lazy var appVersion: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#848484"), font: UIFont.systemFont(ofSize: 16))
    private lazy var tipImgskwl: CardTipImsjlerifView = CardTipImsjlerifView(frame: CGRectZero, style: CardTipStyle.Settskw)
    private lazy var reminder: SetingskwCelsjeView = SetingskwCelsjeView(frame: CGRectZero, style: SettingMineStywlsj.Reminder)
    private lazy var cancel: SetingskwCelsjeView = SetingskwCelsjeView(frame: CGRectZero, style: SettingMineStywlsj.Cancel)
    private lazy var logksj: SetingskwCelsjeView = SetingskwCelsjeView(frame: CGRectZero, style: SettingMineStywlsj.Logout)
    
    private var res_url: String = ""
    weak private var weak_sender: APPActivityButton?
    weak private var pop_view: BasicPresentView?
    
    override func buildPageUI() {
        super.buildPageUI()
        self.title = APPLanguageInsTool.loadLanguage("settitle_wk")
    
        self.logoImsh.corner(11)
        
        self.appNameLab.text = Bundle.jk.appDisplayName
        self.appVersion.text = "V" + Bundle.jk.appVersion
        self.reminder.switchConslwl.addTarget(self, action: #selector(clickSwicth(sender: )), for: UIControl.Event.valueChanged)
        self.cancel.addTarget(self, action: #selector(clickSetskwMisnw(sender: )), for: UIControl.Event.touchUpInside)
        self.logksj.addTarget(self, action: #selector(clickSetskwMisnw(sender: )), for: UIControl.Event.touchUpInside)
        
        self.basicScrollContentView.addSubview(self.logoImsh)
        self.basicScrollContentView.addSubview(self.appNameLab)
        self.basicScrollContentView.addSubview(self.appVersion)
        self.basicScrollContentView.addSubview(self.tipImgskwl)
        self.basicScrollContentView.addSubview(self.reminder)
        self.basicScrollContentView.addSubview(self.cancel)
        self.basicScrollContentView.addSubview(self.logksj)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.logoImsh.snp.makeConstraints { make in
            make.centerX.equalTo(self.view)
            make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 10)
            make.size.equalTo(55)
        }
        
        self.appNameLab.snp.makeConstraints { make in
            make.centerX.equalTo(self.logoImsh)
            make.top.equalTo(self.logoImsh.snp.bottom).offset(LAYOUT_MIN_UNIT * 2)
        }
        
        self.appVersion.snp.makeConstraints { make in
            make.centerX.equalTo(self.appNameLab)
            make.top.equalTo(self.appNameLab.snp.bottom).offset(LAYOUT_MIN_UNIT)
        }
        
        self.tipImgskwl.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4)
            make.top.equalTo(self.appVersion.snp.bottom).offset(LAYOUT_MIN_UNIT * 3.5)
            make.width.equalTo(jk_kScreenW - LAYOUT_MIN_UNIT * 8)
        }
        
        self.reminder.snp.makeConstraints { make in
            make.top.equalTo(self.tipImgskwl.snp.bottom).offset(LAYOUT_MIN_UNIT * 6)
            make.left.width.equalTo(self.tipImgskwl)
        }
        
        self.cancel.snp.makeConstraints { make in
            make.top.equalTo(self.reminder.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.left.width.equalTo(self.reminder)
        }
        
        self.logksj.snp.makeConstraints { make in
            make.top.equalTo(self.cancel.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.left.width.equalTo(self.cancel)
        }
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig(self.res_url, requestParams: [:])) {[weak self] (task: URLSessionDataTask, res :APPSuccessResponse) in
            self?.weak_sender?.stopAnimation()
            GlobalCommonFile.shared.deleteexprikdkInfoFromDiskk()
            self?.pop_view?.dismissPop()
            self?.navigationController?.popToRootViewController(animated: true)
        } failure: {[weak self] _, _ in
            self?.weak_sender?.stopAnimation()
        }
    }

    @objc func clickSwicth(sender: UISwitch) {
        if sender.isOn {
            self.view.makeToast(APPLanguageInsTool.loadLanguage("setting_wkskq"))
        }
    }
    
    @objc func clickSetskwMisnw(sender: SetingskwCelsjeView) {
        switch sender.ske {
        case SettingMineStywlsj.Reminder:
            break
        case SettingMineStywlsj.Cancel:
            let view = CancelAccoskePopskwViwks(frame: CGRectZero)
            view.clickConfirmClosure = {[weak self] (popView: BasicPresentView, sender: APPActivityButton) in
                guard let _pop = popView as? CancelAccoskePopskwViwks, _pop.protocolswsVisw.hasSelected else {
                    popView.makeToast(APPLanguageInsTool.loadLanguage("info_confirm_tip"))
                    return
                }
                
                sender.startAnimation()
                self?.res_url = "immediatelying/lowell"
                self?.weak_sender = sender
                self?.pageNetRequest()
            }
            UIDevice.current.keyWindow().addSubview(view)
            view.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            view.showPresent()
            self.pop_view = view
        case SettingMineStywlsj.Logout:
            let view = logoutPopskwViwks(frame: CGRectZero)
            view.clickConfirmClosure = {[weak self] (popView: BasicPresentView, sender: APPActivityButton) in
                sender.startAnimation()
                self?.res_url = "immediatelying/org"
                self?.weak_sender = sender
                self?.pageNetRequest()
            }
            UIDevice.current.keyWindow().addSubview(view)
            view.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            view.showPresent()
            self.pop_view = view
        }
    }
}
