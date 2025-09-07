//
//  BasicNavigationViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit

class BasicNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.navigationAppearanceSetting()
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if !self.children.isEmpty {
            viewController.hidesBottomBarWhenPushed = true
        } else {
            
        }
        
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        super.pushViewController(viewController, animated: animated)
    }
}

protocol AutoHiddenNavigationBar where Self: UIViewController {
    
}

extension BasicNavigationViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController is AutoHiddenNavigationBar {
            self.setNavigationBarHidden(true, animated: true)
        } else {
            self.setNavigationBarHidden(false, animated: true)
        }
    }
}

extension BasicNavigationViewController: UINavigationBarDelegate {
    func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        if self.viewControllers.count < navigationBar.items?.count ?? 1 {
            return true
        }
        
        var currentPageCanPop = true
        if let c_v = self.topViewController, c_v.conforms(to: CurrentControllerShouldPopProtocol.self) {
            currentPageCanPop = c_v.shouldPop()
        }
        
        if currentPageCanPop {
            DispatchQueue.main.async {
                self.popViewController(animated: true)
            }
        } else {
            for subview in navigationBar.subviews
            {
                if (0.0 < subview.alpha && subview.alpha < 1.0) {
                    UIView.animate(withDuration: 0.25, animations: {
                        subview.alpha = 1.0
                    })
                }
            }
        }
        
        return false
    }
}

private extension BasicNavigationViewController {
    func navigationAppearanceSetting() {
        let appearance = UINavigationBarAppearance()
        let att = [NSAttributedString.Key.foregroundColor: UIColor.hexStringColor(hexString: "#27272E"),
                   NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
        let originalImage = UIImage(systemName: "chevron.backward")
        let tintedImage = originalImage?.withTintColor(UIColor.hexStringColor(hexString: "#27272E"), renderingMode: .alwaysOriginal)
        appearance.configureWithOpaqueBackground() // 关键：不透明背景
        appearance.backgroundColor = .white        // 设置背景色
        appearance.shadowColor = .clear
        
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        self.navigationBar.tintColor = UIColor.hexStringColor(hexString: "#27272E")
        self.navigationBar.backIndicatorImage = tintedImage
        self.navigationBar.backIndicatorTransitionMaskImage = tintedImage
        self.navigationBar.shadowImage = barShadowImage()
        self.navigationBar.titleTextAttributes = att
    }
    
    func barShadowImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: jk_kScreenW, height: 0.5), false, 0)
        let path = UIBezierPath.init(rect: CGRect.init(x: 0, y: 0, width: jk_kScreenW, height: 0.5))
        UIColor.clear.setFill()// 自定义NavigationBar分割线颜色
        path.fill()
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
