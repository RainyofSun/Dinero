//
//  FirstHoViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit

class FirstHoViewController: BasicViewController, AutoHiddenNavigationBar {

    private lazy var bigCard: BigCardViskdl = BigCardViskdl(frame: CGRectZero)
    
    override var changeTabBarColor: Bool {
        return true
    }
    
    override func buildPageUI() {
        super.buildPageUI()
        
        self.basicScrollContentView.addSubview(self.bigCard)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.basicScrollContentView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.bigCard.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.size.equalTo(self.view.size)
        }
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        
    }
}
