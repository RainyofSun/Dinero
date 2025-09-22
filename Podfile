platform :ios, '14.0'

source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!

# 定义公共库
def CommonPods
  pod 'EmptyDataSet-Swift', '5.0.0'
  pod 'FDFullscreenPopGesture', '1.1'
  pod 'IQKeyboardManagerSwift', '8.0.0'
end

def OCFrameworks
 pod 'AFNetworking', :git => 'https://github.com/crasowas/AFNetworking.git'
 pod 'CYSwiftExtension', '1.6.7'
end

def HostPods
  pod 'BRPickerView/Default','2.9.1'
  pod 'FBSDKCoreKit', '18.0.0'
end

target 'Dinero' do
  CommonPods()
  OCFrameworks()
  HostPods()
end

post_install do |installer|
  
  installer.pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
    end
  end
  
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    config.build_settings['CODE_SIGN_IDENTITY'] = ''
  end
end
