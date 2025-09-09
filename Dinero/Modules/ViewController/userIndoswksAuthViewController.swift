//
//  userIndoswksAuthViewController.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/9.
//

import UIKit

class userIndoswksAuthViewController: BasicViewController {

    private(set) lazy var presentView: CardUsesidnwIfosKsuwjPoseiView = CardUsesidnwIfosKsuwjPoseiView(frame: CGRectZero)
    
    override func buildPageUI() {
        self.presentView.alpha = 1
        self.presentView._preske_vc = self
        self.view.addSubview(self.presentView)
    }
    
    override func layoutPageViews() {
        self.presentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
