//
//  FontExtension.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit

enum InterFontWeight: String {
    case Regular = "Inter-Regular"
    case Regular_Italic = "Inter-Regular_Italic"
    case Regular_Thin_BETA = "Inter-ThinBETA"
    case Regular_Thin = "Inter-Regular_Thin"
    case Regular_Thin_Italic = "Inter-Regular_Thin-Italic"
    case Regular_Extra_Light_BETA = "Inter-ExtraLightBETA"
    case Regular_Extra_Light = "Inter-Regular_Extra-Light"
    case Regular_Extra_Light_Italic = "Inter-Regular_Extra-Light-Italic"
    case Regular_Light_BETA = "Inter-LightBETA"
    case Regular_Light = "Inter-Regular_Light"
    case Regular_Light_Italic = "Inter-Regular_Light-Italic"
    case Medium = "Inter-Medium"
    case Regular_Medium = "Inter-Regular_Medium"
    case Regular_Medium_Italic = "Inter-Regular_Medium-Italic"
    case SemiBold = "Inter-SemiBold"
    case Regular_SemiBold = "Inter-Regular_Semi-Bold"
    case Regular_SemiBold_Italic = "Inter-Regular_Semi-Bold-Italic"
    case Bold = "Inter-Bold"
    case Regular_Bold = "Inter-Regular_Bold"
    case Regular_Bold_Italic = "Inter-Regular_Bold-Italic"
    case Extra_Bold = "Inter-ExtraBold"
    case Regular_Extra_Bold = "Inter-Regular_Extra-Bold"
    case Regular_Extra_Bold_Italic = "Inter-Regular_Extra-Bold-Italic"
    case Black = "Inter-Black"
    case Regular_Black = "Inter-Regular_Black"
    case Regular_Black_Italic = "Inter-Regular_Black-Italic"
}

extension UIFont {
    static func interFont(size: CGFloat, fontStyle: InterFontWeight) -> UIFont {
        return self.init(name: fontStyle.rawValue, size: size) ?? UIFont.systemFont(ofSize: size);
    }
}
