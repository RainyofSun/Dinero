//
//  ButtonExtension.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit

extension UIButton {
    static func buildLoadingButton(_ title: String) -> APPActivityButton {
        let btn: APPActivityButton = APPActivityButton(frame: CGRectZero)
        btn.setTitle(title, for: UIControl.State.normal)
        btn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return btn
    }
    
    static func buildGradientLoadingButton(_ title: String) -> APPActivityButton {
        let btn: APPActivityButton = UIButton.buildLoadingButton(title)
        btn.setGradientColors([Primary_Color1, Primary_Color2], style: GradientDirectionStyle.leftToRight)
        return btn
    }
}
