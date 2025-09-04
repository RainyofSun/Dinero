//
//  SceneDelegate.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit
@_exported import CYSwiftExtension
@_exported import Toast

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        APPNetRequestURLConfig.setNetworkDebugRequestURL("http://47.251.169.113/irectioner/", releaseUrl: "")
        APPNetResponseParsingConfig.setParsingConfig("tell", service: "org", data: "unstats")
        setNetRequestPublicParams()
        #if DEBUG
        APPCocoaLog.shared.registe(with: EnvType.other)
        #else
        APPCocoaLog.shared.registe(with: EnvType.prod)
        #endif
        DeviceNetObserver.shared.StartNetworkStatusListener()
        DeviceAuthorizationTool.authorization()
        APPLanguageInsTool.setLocalLanguage(InterbationalLanguage.English)
        buildRootVC()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: {
            self.deviceAuthoskdawidkm()
        })
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

extension SceneDelegate {
    func setNetRequestPublicParams() {
        let public_params: APPPublicParamsKey = APPPublicParamsKey()
        public_params.appVersionKey = "demographic"
        public_params.deviceNameKey = "equivalent"
        public_params.idfvKey = "city"
        public_params.idfaKey = "mullainathan"
        public_params.loginTokenKey = "got"
        public_params.systemVersionKey = "millennium"
        public_params.countryCodeKey = "indicators"
        
        APPPublicParams.request().appCommonParamsKeyModel(public_params)
    }
    
    func buildRootVC() {
        CSToastManager.setDefaultPosition(CSToastPositionCenter)
        
        self.window?.backgroundColor = .white
        let piedhksVC = StartFlashViewController()
        piedhksVC.sDelegate = self
        self.window?.rootViewController = piedhksVC
        self.window?.makeKeyAndVisible()
    }
    
    func showAllFonts(){
        let familyNames = UIFont.familyNames
        
        var index:Int = 0
        
        for familyName in familyNames {
            
            let fontNames = UIFont.fontNames(forFamilyName: familyName as String)
            print("------- 字体家族 -------- \(familyName)")
            for fontName in fontNames
            {
                index += 1
                
                print("第 \(index) 个字体，字体font名称：\(fontName)")
            }
        }
    }
    
    func deviceAuthoskdawidkm() {
        DeviceAuthorizationTool.authorization().requestDeviceIDFAAuthrization { _ in
            
        }
        
        DeviceAuthorizationTool.authorization().requestDeviceLocationAuthrization(WhenInUse)
        
        if DeviceAuthorizationTool.authorization().locationAuthorization() == Authorized || DeviceAuthorizationTool.authorization().locationAuthorization() == Limited {
            DeviceAuthorizationTool.authorization().startDeviceLocation()
            if GlobalCommonFile.shared.isAppInitializationSuccess {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                    APPCocoaLog.debug("定位埋点上报 ----------")
                    BuryShuJuTool.shujuLocationReportswks()
                })
            } else {
                
            }
        }
        
        if DeviceAuthorizationTool.authorization().attTrackingStatus() == .authorized {
            if GlobalCommonFile.shared.isAppInitializationSuccess {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                    APPCocoaLog.debug("ATT 埋点上报 ----------")
                    BuryShuJuTool.IDFAAndIDFVReport()
                })
            } else {
                
            }
        }
        
        if GlobalCommonFile.shared.isAppInitializationSuccess {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                APPCocoaLog.debug("设备信息 埋点上报 ----------")
                BuryShuJuTool.deviceInfoReport()
            })
        }
    }
}

extension SceneDelegate: FlashProtocol {
    func didMissFlashViews() {
        let trans = CATransition()
        trans.duration = 0.5
        trans.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        trans.type = .fade
        self.window?.layer.add(trans, forKey: nil)
        self.window?.rootViewController = BasicTabbarViewController()
    }
}
