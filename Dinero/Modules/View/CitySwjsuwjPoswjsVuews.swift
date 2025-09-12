//
//  CitySwjsuwjPoswjsVuews.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/11.
//

import UIKit

class CitySwjsuwjPoswjsVuews: BasicPresentView {

    open var selec_si_city: String = ""
    
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
    
    private var _leftswj_askw: [CityModeswkah] = []
    private var _midwldi_askw: [City] = []
    private var _selsa_all_cskw: Bool = false
    
    override func buildPresentView() {
        super.buildPresentView()
        
        self.titleLab.text = APPLanguageInsTool.loadLanguage("address_tip")
        
        self.provensiwname.tag = 1000
        self.citysanwakw.tag = 1001
        
        self.provensiwname.addTarget(self, action: #selector(swicthhsowkScrollwks(sender: )), for: UIControl.Event.touchUpInside)
        self.citysanwakw.addTarget(self, action: #selector(swicthhsowkScrollwks(sender: )), for: UIControl.Event.touchUpInside)
        
        self.prosbiwntableView.delegate = self
        self.cisrjwtableView.delegate = self
        self.prosbiwntableView.dataSource = self
        self.cisrjwtableView.dataSource = self
        self.prosbiwntableView.register(CisyeyPisnkerTableViewCell.self, forCellReuseIdentifier: CisyeyPisnkerTableViewCell.className())
        self.cisrjwtableView.register(CisyeyPisnkerTableViewCell.self, forCellReuseIdentifier: CisyeyPisnkerTableViewCell.className())
        
        self.contentView.addSubview(self.provensiwname)
        self.contentView.addSubview(self.citysanwakw)
        self.contentView.addSubview(self.sdakwline)
        self.contentView.addSubview(self.hSceolView)
        self.hSceolView.addSubview(self.prosbiwntableView)
        self.hSceolView.addSubview(self.cisrjwtableView)
        
        if FileManager.default.fileExists(atPath: GlobalCommonFile.shared.ciprosjdkCityPath) {
            let modes = CityModeswkah.readCistForsmwDiwska()
            if !modes.isEmpty {
                self._leftswj_askw = modes
                self.prosbiwntableView.reloadData()
            }
        }
    }
    
    override func layoutPresentView() {
        super.layoutPresentView()
        
        self.provensiwname.snp.makeConstraints { make in
            make.top.equalTo(self.titleLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 4)
            make.left.equalTo(self.titleLab)
        }
        
        self.citysanwakw.snp.makeConstraints { make in
            make.top.equalTo(self.provensiwname.snp.bottom).offset(LAYOUT_MIN_UNIT * 2.5)
            make.left.equalTo(self.provensiwname)
        }
        
        self.sdakwline.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 4)
            make.top.equalTo(self.citysanwakw.snp.bottom).offset(LAYOUT_MIN_UNIT * 4)
        }
        
        self.hSceolView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.top.equalTo(self.sdakwline.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.height.greaterThanOrEqualTo(250)
            make.bottom.equalTo(self.confirmBtn.snp.top).offset(-LAYOUT_MIN_UNIT * 3)
        }
        
        self.prosbiwntableView.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.width.equalTo(jk_kScreenW)
            make.height.equalTo(230)
        }
        
        self.cisrjwtableView.snp.makeConstraints { make in
            make.left.equalTo(self.prosbiwntableView.snp.right)
            make.right.equalToSuperview()
            make.top.size.equalTo(self.prosbiwntableView)
        }
    }
    
    override func confirmClick(sender: APPActivityButton) {
        guard self._selsa_all_cskw else {
            UIDevice.current.keyWindow().makeToast(APPLanguageInsTool.loadLanguage("address_tip"))
            return
        }
        
        super.confirmClick(sender: sender)
    }
    
    @objc func swicthhsowkScrollwks(sender: UIButton) {
        self.hSceolView.setContentOffset(CGPoint(x: jk_kScreenW * CGFloat(sender.tag - 1000), y: .zero), animated: true)
    }
}

extension CitySwjsuwjPoswjsVuews: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.prosbiwntableView {
            return self._leftswj_askw.count
        }
        
        if tableView == self.cisrjwtableView {
            return self._midwldi_askw.count
        }
        
        return .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _cell = tableView.dequeueReusableCell(withIdentifier: CisyeyPisnkerTableViewCell.className(), for: indexPath) as? CisyeyPisnkerTableViewCell else {
            return UITableViewCell()
        }
        
        if tableView == self.prosbiwntableView {
            _cell.cislwLab.text = self._leftswj_askw[indexPath.row].released
        }
        
        if tableView == self.cisrjwtableView {
            _cell.cislwLab.text = self._midwldi_askw[indexPath.row].rans
        }
        
        return _cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == self.prosbiwntableView {
            self.provensiwname.setTitle(self._leftswj_askw[indexPath.row].released, for: UIControl.State.normal)
            self.provensiwname.setTitleColor(Primary_Color1, for: UIControl.State.normal)
            self.citysanwakw.setTitle(APPLanguageInsTool.loadLanguage("address_sel"), for: UIControl.State.normal)
            self.citysanwakw.setTitleColor(UIColor.hexStringColor(hexString: "#999999"), for: UIControl.State.normal)
            
            if let _city = self._leftswj_askw[indexPath.row].ucla {
                self._midwldi_askw.append(contentsOf: _city)
                self.cisrjwtableView.reloadData()
            }
            
            self._selsa_all_cskw = false
            self.selec_si_city = self.provensiwname.currentTitle ?? ""
            
            self.swicthhsowkScrollwks(sender: self.citysanwakw)
        }
        
        if tableView == self.cisrjwtableView {
            self.citysanwakw.setTitle(self._midwldi_askw[indexPath.row].rans, for: UIControl.State.normal)
            self.citysanwakw.setTitleColor(Primary_Color1, for: UIControl.State.normal)
            
            self.selec_si_city += (" | " + (self.citysanwakw.currentTitle ?? ""))
            self._selsa_all_cskw = true
        }
        
        guard let _cell = tableView.cellForRow(at: indexPath) as? CisyeyPisnkerTableViewCell else {
            return
        }
        
        _cell.setSelected(true, animated: true)
    }
}
