//
//  LoginPresnetawkchView.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/4.
//

import UIKit

class LoginPresnetawkchView: BasicPresentView {

    weak open var f_view_controller: LogiscskViewController?
    private lazy var dotLab12: dotTextLabel = dotTextLabel(frame: CGRectZero)
    private lazy var dotLab3: dotTextLabel = dotTextLabel(frame: CGRectZero)
    private lazy var phoneTefiled: ForbidActionTextFiled = ForbidActionTextFiled(frame: CGRectZero)
    private lazy var codeTefiled: ForbidActionTextFiled = ForbidActionTextFiled(frame: CGRectZero)
    private lazy var codeBtn: APPCodeTimerButton = APPCodeTimerButton(frame: CGRect(origin: CGPointZero, size: CGSizeMake(150, 50)))
    private lazy var voiceCodeBtn: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        var attris = NSAttributedString(string: APPLanguageInsTool.loadLanguage("login_v_voice"), attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#FF9E00"), .font: UIFont.systemFont(ofSize: 16)])
        attris = attris.jk.insertImage(imgName: "login_voice", imgBounds: CGRect(origin: CGPointMake(0, -5), size: CGSize(width: 22, height: 22)))
        view.setAttributedTitle(attris, for: UIControl.State.normal)
        return view
    }()
    private lazy var yinSiView: ProtocolView = ProtocolView(frame: CGRectZero)
    
    override func buildPresentView() {
        super.buildPresentView()
        self.alpha = 1
        self.titleLab.text = APPLanguageInsTool.loadLanguage("login_text1")
        
        self.dotLab12.textsioLab.text = APPLanguageInsTool.loadLanguage("login_phone")
        self.dotLab3.textsioLab.text = APPLanguageInsTool.loadLanguage("login_v_code")
        self.phoneTefiled.attributedPlaceholder = NSAttributedString(string: APPLanguageInsTool.loadLanguage("login_phone_p"), attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#858170"), .font: UIFont.interFont(size: 14, fontStyle: InterFontWeight.Regular)])
        self.codeTefiled.attributedPlaceholder = NSAttributedString(string: APPLanguageInsTool.loadLanguage("login_v_code"), attributes: [.foregroundColor: UIColor.hexStringColor(hexString: "#858170"), .font: UIFont.interFont(size: 14, fontStyle: InterFontWeight.Regular)])
        
        self.codeBtn.setTimerButtonTitle(APPLanguageInsTool.loadLanguage("login_v_code_btn"), titleColor: UIColor.hexStringColor(hexString: "#D40028"))
        
        self.codeTefiled.delegate = self
        
        if let _t = UserDefaults.standard.string(forKey: "userPhone") {
            self.phoneTefiled.text = _t
        }
        
        self.phoneTefiled.backgroundColor = UIColor.hexStringColor(hexString: "#FFF6CA")
        self.phoneTefiled.borderStyle = .none
        self.phoneTefiled.layer.borderWidth = 1
        self.phoneTefiled.layer.borderColor = Primary_Color_red.cgColor
        self.phoneTefiled.corner(22)
        self.phoneTefiled.keyboardType = .numberPad
        
        self.codeTefiled.backgroundColor = UIColor.hexStringColor(hexString: "#FFF6CA")
        self.codeTefiled.borderStyle = .none
        self.codeTefiled.layer.borderWidth = 1
        self.codeTefiled.layer.borderColor = Primary_Color_red.cgColor
        self.codeTefiled.corner(22)
        self.codeTefiled.keyboardType = .numberPad
        
        self.codeTefiled.rightView = self.codeBtn
        self.codeTefiled.rightViewMode = .always
        
        self.yinSiView.setAgreeButton(UIImage(named: "login_disagree")!, selectedImg: UIImage(named: "login_agree")!)
        let tshdk1: NSAttributedString = NSAttributedString(string: APPLanguageInsTool.loadLanguage("login_ppp"), attributes: [.foregroundColor: Primary_Color_red, .font: UIFont.systemFont(ofSize: 14)])
        let tksm2: NSAttributedString = NSAttributedString(string: APPLanguageInsTool.loadLanguage("login_privicy"), attributes: [.foregroundColor: Primary_Color_Black, .font: UIFont.systemFont(ofSize: 14)])
        
        self.yinSiView.setProtocol(tshdk1, protocolPrefix: tksm2)
        
        self.codeBtn.addTarget(self, action: #selector(smsCode(sender: )), for: UIControl.Event.touchUpInside)
        self.voiceCodeBtn.addTarget(self, action: #selector(getVoiceSkSender(sender: )), for: UIControl.Event.touchUpInside)
        self.yinSiView.protocolDelegate = self
        
        self.contentView.addSubview(self.dotLab12)
        self.contentView.addSubview(self.phoneTefiled)
        self.contentView.addSubview(self.dotLab3)
        self.contentView.addSubview(self.codeTefiled)
        self.contentView.addSubview(self.voiceCodeBtn)
        self.contentView.addSubview(self.yinSiView)
        
        if let _t = UserDefaults.standard.string(forKey: "userPhone") {
            self.phoneTefiled.text = _t
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6, execute: {
                if self.codeTefiled.canBecomeFirstResponder {
                    self.codeTefiled.becomeFirstResponder()
                }
            })
        } else {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6, execute: {
                if self.phoneTefiled.canBecomeFirstResponder {
                    self.phoneTefiled.becomeFirstResponder()
                }
            })
        }
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.dotLab12.snp.makeConstraints { make in
            make.left.equalTo(self.phoneTefiled)
            make.top.equalTo(self.titleLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 4.5)
        }
        
        self.phoneTefiled.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(54)
            make.top.equalTo(self.dotLab12.snp.bottom).offset(LAYOUT_MIN_UNIT * 2)
        }
        
        self.dotLab3.snp.makeConstraints { make in
            make.left.equalTo(self.dotLab12)
            make.top.equalTo(self.phoneTefiled.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
        }
        
        self.codeTefiled.snp.makeConstraints { make in
            make.horizontalEdges.height.equalTo(self.phoneTefiled)
            make.top.equalTo(self.dotLab3.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
        }
        
        self.voiceCodeBtn.snp.makeConstraints { make in
            make.right.equalTo(self.codeTefiled)
            make.top.equalTo(self.codeTefiled.snp.bottom).offset(LAYOUT_MIN_UNIT * 6)
        }
        
        self.yinSiView.snp.makeConstraints { make in
            make.bottom.equalTo(self.confirmBtn.snp.top).offset(-(LAYOUT_MIN_UNIT * 2))
            make.left.equalTo(self.confirmBtn)
            make.width.lessThanOrEqualTo(jk_kScreenW - LAYOUT_MIN_UNIT * 15)
            make.top.equalTo(self.voiceCodeBtn.snp.bottom).offset(120)
        }
    }
    
    override func closePresentView() {
        self.codeBtn.initCodeTimerStatus()
        NotificationCenter.default.post(name: NSNotification.Name.init("refreshHome"), object: nil)
        self.f_view_controller?.dismiss(animated: true)
    }

    override func confirmClick(sender: APPActivityButton) {
        guard self.yinSiView.hasSelected else {
            self.makeToast(APPLanguageInsTool.loadLanguage("login_yinsi"))
            return
        }
        
        guard let _p_text = self.phoneTefiled.text else {
            self.makeToast(APPLanguageInsTool.loadLanguage("login_phone_p"))
            return
        }
        
        guard let _c_text = self.codeTefiled.text else {
            self.makeToast(APPLanguageInsTool.loadLanguage("login_v_code_t"))
            return
        }
        
        sender.startAnimation()
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/tell", requestParams: ["issn":_p_text, "determination": _c_text])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            sender.stopAnimation()
            guard let _d = res.jsonDict else {
                return
            }
            
            GlobalCommonFile.shared.appLoginInfo = UserloginsskkModel.model(with: _d)
            UserDefaults.standard.set(GlobalCommonFile.shared.appLoginInfo?.issn, forKey: "userPhone")
            UserDefaults.standard.synchronize()
            GlobalCommonFile.shared.encoderukllsdinfoToDskkd()
            BuryShuJuTool.riskControlRepoeri(type: TongJiEventUploadStyle.TJ_Login, beginTime: self?.f_view_controller?.buryingStartTime, endTime: Date().jk.dateToTimeStamp())
            self?.codeBtn.stop()
            self?.closePresentView()
            
        } failure: {[weak self] _, _ in
            sender.stopAnimation()
            self?.codeTefiled.jk.shake(times: 5, interval: 0.04) {
                self?.codeTefiled.text = ""
                if let _t = self?.codeTefiled.canBecomeFirstResponder, _t {
                    self?.codeTefiled.becomeFirstResponder()
                }
            }
        }
    }
}

@objc extension LoginPresnetawkchView {
    func smsCode(sender: APPCodeTimerButton) {
        guard let _p_text = self.phoneTefiled.text else {
            self.makeToast(APPLanguageInsTool.loadLanguage("login_phone_p"))
            return
        }
        
        sender.isEnabled = false
        self.f_view_controller?.buryingStartTime = Date().jk.dateToTimeStamp()
        self.makeToastActivity(CSToastPositionCenter)
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/olof", requestParams: ["chase": _p_text])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            sender.isEnabled = true
            self?.hideToastActivity()
            sender.start()
            self?.makeToast(res.responseMsg ?? "")
            
            if let _can = self?.codeTefiled.canBecomeFirstResponder, _can {
                self?.codeTefiled.becomeFirstResponder()
            }
        } failure: {[weak self] _, _ in
            sender.isEnabled = true
            self?.hideToastActivity()
        }
    }
    
    func getVoiceSkSender(sender: UIButton) {
        guard let _p_text = self.phoneTefiled.text else {
            self.makeToast(APPLanguageInsTool.loadLanguage("login_phone_p"))
            return
        }
        
        sender.isEnabled = false
        self.f_view_controller?.buryingStartTime = Date().jk.dateToTimeStamp()
        self.makeToastActivity(CSToastPositionCenter)
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/rooth", requestParams: ["chase": _p_text])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            sender.isEnabled = true
            self?.hideToastActivity()
            self?.makeToast(res.responseMsg)
            
            if let _can = self?.codeTefiled.canBecomeFirstResponder, _can {
                self?.codeTefiled.becomeFirstResponder()
            }
        } failure: {[weak self] _, _ in
            sender.isEnabled = true
            self?.hideToastActivity()
        }
    }
}

extension LoginPresnetawkchView: APPProtocolDelegate {
    func gotoProtocol() {
        guard let _p = GlobalCommonFile.shared.privacyURL else {
            return
        }
        
        LuYouTool.shared.gotoPage(pageUrl: _p)
    }
}

extension LoginPresnetawkchView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        // 最大长度限制为 10
        let maxLength = 22
        return updatedText.count <= maxLength
    }
}
