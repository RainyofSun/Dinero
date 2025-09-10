//
//  AuthBasicViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/8.
//

import UIKit

class AuthBasicViewController: BasicViewController {

    private(set) lazy var bottomsViwe: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = .white
        return view
    }()
    
    private(set) lazy var confirmBtn: APPActivityButton = APPActivityButton.buildGradientLoadingButton(APPLanguageInsTool.loadLanguage("auth_btn"))
    private(set) var _next_toelsl_map: [ChanPinAuthElement: String]?
    
    init(certificationTitle title: String?, nextAuthTitle next: [ChanPinAuthElement: String]? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        self._next_toelsl_map = next
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        self.pageNetRequest()
    }
    
    override func buildPageUI() {
        super.buildPageUI()
        
        self.confirmBtn.corner(16)
        self.confirmBtn.addTarget(self, action: #selector(clickNextBusjwk(sender: )), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(self.bottomsViwe)
        self.bottomsViwe.addSubview(self.confirmBtn)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.basicScrollContentView.snp.remakeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(self.bottomsViwe.snp.top).offset(-LAYOUT_MIN_UNIT * 2)
        }
        
        self.bottomsViwe.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
        self.confirmBtn.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 12)
            make.height.equalTo(50)
            make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 2)
            make.bottom.equalToSuperview().offset(-UIDevice.current.keyWindow().safeAreaInsets.bottom - LAYOUT_MIN_UNIT * 2)
        }
    }
    
    @objc func clickNextBusjwk(sender: APPActivityButton) {
        
    }
}
