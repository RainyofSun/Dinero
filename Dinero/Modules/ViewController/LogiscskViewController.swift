//
//  LogiscskViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit

class LogiscskViewController: BasicViewController, AutoHiddenNavigationBar {

    private lazy var presentView: LoginPresnetawkchView = LoginPresnetawkchView(frame: CGRectZero)
    
    override func buildPageUI() {
        self.presentView.f_view_controller = self
        self.view.addSubview(self.presentView)
    }
    
    override func layoutPageViews() {
        self.presentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
