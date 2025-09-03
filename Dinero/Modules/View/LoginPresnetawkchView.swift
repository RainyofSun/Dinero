//
//  LoginPresnetawkchView.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/4.
//

import UIKit

class LoginPresnetawkchView: BasicPresentView {

    weak open var f_view_controller: UIViewController?
    private lazy var dotLab12: dotTextLabel = dotTextLabel(frame: CGRectZero)
    private lazy var dotLab3: dotTextLabel = dotTextLabel(frame: CGRectZero)
    private lazy var phoneTefiled: ForbidActionTextFiled = ForbidActionTextFiled(frame: CGRectZero)
    private lazy var codeTefiled: ForbidActionTextFiled = ForbidActionTextFiled(frame: CGRectZero)
    private lazy var codeBtn: APPCodeTimerButton = APPCodeTimerButton(frame: CGRectZero)
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
        
        self.yinSiView.setAgreeButton(UIImage(named: "login_disagree")!, selectedImg: UIImage(named: "login_agree")!)
        let tshdk1: NSAttributedString = NSAttributedString(string: APPLanguageInsTool.loadLanguage("login_ppp"), attributes: [.foregroundColor: Primary_Color_red, .font: UIFont.systemFont(ofSize: 14)])
        let tksm2: NSAttributedString = NSAttributedString(string: APPLanguageInsTool.loadLanguage("login_privicy"), attributes: [.foregroundColor: Primary_Color_Black, .font: UIFont.systemFont(ofSize: 14)])
        
        self.yinSiView.setProtocol(tshdk1, protocolPrefix: tksm2, defaultSelected: true)
        
        self.codeBtn.addTarget(self, action: #selector(smsCode(sender: )), for: UIControl.Event.touchUpInside)
        self.voiceCodeBtn.addTarget(self, action: #selector(getVoiceSkSender(sender: )), for: UIControl.Event.touchUpInside)
        self.yinSiView.protocolDelegate = self
        
        self.contentView.addSubview(self.dotLab12)
        self.contentView.addSubview(self.phoneTefiled)
        self.contentView.addSubview(self.dotLab3)
        self.contentView.addSubview(self.codeTefiled)
        self.codeTefiled.addSubview(self.codeBtn)
        self.contentView.addSubview(self.voiceCodeBtn)
        self.contentView.addSubview(self.yinSiView)
        
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
        
        self.codeBtn.snp.makeConstraints { make in
            make.centerY.equalTo(self.codeTefiled)
            make.right.equalToSuperview().offset(LAYOUT_MIN_UNIT * 2)
        }
        
        self.voiceCodeBtn.snp.makeConstraints { make in
            make.right.equalTo(self.codeTefiled)
            make.top.equalTo(self.codeTefiled.snp.bottom).offset(LAYOUT_MIN_UNIT * 6)
        }
        
        self.yinSiView.snp.makeConstraints { make in
            make.bottom.equalTo(self.confirmBtn.snp.top).offset(-(LAYOUT_MIN_UNIT * 2))
            make.left.equalTo(self.confirmBtn)
            make.top.equalTo(self.voiceCodeBtn.snp.bottom).offset(120)
        }
    }
    
    override func closePresentView(sender: UIButton) {
        self.f_view_controller?.dismiss(animated: true)
    }

    override func confirmClick(sender: UIButton) {
        APPCocoaLog.debug("---------")
    }
}

@objc extension LoginPresnetawkchView {
    func smsCode(sender: APPCodeTimerButton) {
        
    }
    
    func getVoiceSkSender(sender: UIButton) {
        
    }
}

extension LoginPresnetawkchView: APPProtocolDelegate {
    func gotoProtocol() {
        
    }
}

extension LoginPresnetawkchView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        // 最大长度限制为 10
        let maxLength = 6
        return updatedText.count <= maxLength
    }
}
