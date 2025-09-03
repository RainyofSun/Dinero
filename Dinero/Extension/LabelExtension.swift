//
//  LabelExtension.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit

extension UILabel {
    static func buildNormalTextLabel(_ text: String, t_color: UIColor, font: UIFont) -> UILabel {
        let label = UILabel(frame: CGRectZero)
        label.text = text
        label.font = font
        label.textColor = t_color
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
    
    static func buildGradientTextLabel(_ text: String, t_color: UIColor, font: UIFont) -> GradientTextLabel {
        let label = GradientTextLabel(frame: CGRectZero)
        label.text = text
        label.font = font
        label.textColor = t_color
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
}
