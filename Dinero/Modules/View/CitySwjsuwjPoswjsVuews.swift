//
//  CitySwjsuwjPoswjsVuews.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/11.
//

import UIKit

class CitySwjsuwjPoswjsVuews: BasicPresentView {

    private lazy var provensiwname: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        view.setTitle(APPLanguageInsTool.loadLanguage("address_sel"), for: UIControl.State.normal)
        view.setTitleColor(UIColor.hexStringColor(hexString: "#999999"), for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.interFont(size: 12, fontStyle: InterFontWeight.Regular)
        return view
    }()
    
    private lazy var citysanwakw: UIButton = {
        let view = UIButton(type: UIButton.ButtonType.custom)
        view.setTitle(APPLanguageInsTool.loadLanguage("address_sel"), for: UIControl.State.normal)
        view.setTitleColor(UIColor.hexStringColor(hexString: "#999999"), for: UIControl.State.normal)
        view.titleLabel?.font = UIFont.interFont(size: 12, fontStyle: InterFontWeight.Regular)
        return view
    }()
    
    private lazy var sdakwline: UIImageView = UIImageView(image: UIImage(named: "dashLines"))
    
    private lazy var prosbiwntableView: UITableView = {
        let view = UITableView(frame: CGRectZero, style: UITableView.Style.plain)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        view.separatorStyle = .none
        return view
    }()
    
    private lazy var cisrjwtableView: UITableView = {
        let view = UITableView(frame: CGRectZero, style: UITableView.Style.plain)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        view.separatorStyle = .none
        return view
    }()
    
    private lazy var hSceolView: UIScrollView = {
        let view = UIScrollView(frame: CGRectZero)
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        view.isScrollEnabled = false
        return view
    }()
    
    override func buildPresentView() {
        super.buildPresentView()
        
        self.titleLab.text = APPLanguageInsTool.loadLanguage("address_tip")
        
        self.contentView.addSubview(self.provensiwname)
        self.contentView.addSubview(self.cisrjwtableView)
        self.contentView.addSubview(self.sdakwline)
        self.contentView.addSubview(self.hSceolView)
        self.hSceolView.addSubview(self.prosbiwntableView)
        self.hSceolView.addSubview(self.cisrjwtableView)
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
    }
}
