//
//  MacroDefine.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit

let LAYOUT_MIN_UNIT: CGFloat = 4.0

let Primary_Color1: UIColor = UIColor.hexStringColor(hexString: "#F23055")
let Primary_Color2: UIColor = UIColor.hexStringColor(hexString: "#FFD06C")
let Primary_Color_red: UIColor = UIColor.hexStringColor(hexString: "#D40028")
let Primary_Color_Black: UIColor = UIColor.hexStringColor(hexString: "#333333")

enum TongJiEventUploadStyle: String {
    case TJ_Login = "1"
    case TJ_Query = "2"
    case TJ_IDCardAlert = "3"
    case TJ_TakingFace = "6"
    case TJ_PersonalInfo = "7"
    case TJ_JobInfo = "8"
    case TJ_LianXiRenInfo = "9"
    case TJ_BankInfo = "10"
    case TJ_StartApply = "11"
    case TJ_EndAppply = "12"
}

enum ShouYeElement: String {
    case BigpwjsuCard = "inb"
    case SmallalsowCard = "inc"
    case ProductskkList = "ind"
}

enum ChanPinAuthElement: String {
    case Certif_Query = "gapa"
    case Certif_ID_Cosujward = "gapb"
    case Certif_Persopalsjnal_Inuywjfo = "gapc"
    case Certif_Job_Info = "gapd"
    case Certif_Contesdkcts = "gape"
    case Certif_BankkskCard = "gapf"
}

enum RenZhengElemeent: String {
    case RZ_Enum = "economicb"
    case RZ_Text = "economica"
    case RZ_City = "economice"
    case RZ_Time = "economicc"
    case RZ_Tips = "economicd"
}

let APP_SETTING: String = "ios://Dine.roFu.erza/gap"
let APP_HOME: String = "ios://Dine.roFu.erza/occupational"
let APP_LOGIN: String = "ios://Dine.roFu.erza/gender"
let APP_ORDER: String = "ios://Dine.roFu.erza/these"
let APP_PRODUCT: String = "ios://Dine.roFu.erza/this"
let APP_Order_list: String = "ios://Dine.roFu.erza/ilswmdk"

/*
 ---------------------------
 1. 文档地址：https://doc.alta-dg.mx/mx_dinero_fuerza_ios
 2. 文档反转义地址：https://doc.alta-dg.mx/decode.php?project=mx_dinero_fuerza_ios
 3. 接口访问地址：http://47.251.169.113/irectioner
  
  
 接口文档账号：dev
 接口文档密码：fly2024
  
  
 4. 官方文档:https://developer.apple.com/support/third-party-SDK-requirements
 5. 隐私清单文档-必看(持续更新 ): http://47.238.207.2:3031/APP/AppPrivacyChecklist_doc.git
 账号：wendang
 密码：wendang123
  
  
 Tips:  接口调试流程注意文档  https://pwdgtjoqfr.feishu.cn/docx/PYMwdLwDwoey7pxH5fJcC0tlnRe
  
  
 6. 证件和流程调试补充文档  https://note.youdao.com/s/cJPkcHQz
  
  
 7. H5交互函数：
 SeekYet(String url)页面跳转
 WomenOr()关闭当前webview
 InTo(String url, String params)带参数页面跳转
 WomenPreferences()回到首页，并关闭当前页
 InequalityDiscrimination()回到个人中心，并关闭当前页
 InWork()跳转到登录页，并清空页面栈
 MeasurableAccount(String phone)拨打电话号码（客户端补充"tel:"）
 TheirNot() app store评分功能
 HarmfulIs() 确认申请埋点调用方法
  
  
 8. 数据检查网站，可检查埋点数据，设备信息上报，位置信息上报，idfa&idfv上报 (可自行检查):
 http://47.251.142.96:8100/index.html
 账号：admin
 密码：666666
 -----------------------------
 */
/// 关闭当前Web
let CloseWebPage: String = "WomenOr"
/// 页面带参数跳转
let PageTransitionNoParams: String = "InTo"
/// 页面带参数跳转
let PageTransitionWithParams: String = "AcrossOf"
/// 关闭当前页面回到首页
let CloseAndGotoHome: String = "WomenPreferences"
/// 关闭当前页面回到个人中心
let CloseAndGotoMineCenter: String = "ThisX"
/// 清空页面栈，跳转登录
let CloseAndGotoLoginPage: String = "InWork"
/// App Store评分
let GotoAppStore: String = "TheirNot"
/// 确认申请埋点
let ConfirmApplyBury: String = "HarmfulIs"
///// 开始绑卡时间
//let StartBindingBankCard: String = "ImagingUnit"
///// 结束绑卡时间
//let EndBindingBankCard: String = "ForA"

// TODO 替换
let ke_bian_service_address: String = "https://ph01-dc.oss-ap-southeast-6.aliyuncs.com/"
let ke_bina_service_domain: String = "joy-cash/jyc.json"

class TYGlobalModel: BasicResponseModel {
    /// 标题
    var graphic: String?
    /// 值
    var extensive: String?
    /////////////// 产品详情 ////////////////
    /// 产品详情协议跳转地址
    var done: String?
    /// 产品详情使用 - 值
    var fatal: String?
}

class TYXuanZeModel: BasicResponseModel {
    /// 标题
    var foreign: String?
    /// 值
    var late: String?
}
