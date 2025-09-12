//
//  ThirdMineswlViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit

class ThirdMineswlViewController: BasicViewController {

    private lazy var headerism: UIImageView = UIImageView(image: UIImage(named: "header"))
    private lazy var phoneslLab: UILabel = UILabel.buildNormalTextLabel("", t_color: Primary_Color_Black, font: UIFont.systemFont(ofSize: 16))
    private lazy var tipsView: CardTipImsjlerifView = CardTipImsjlerifView(frame: CGRectZero, style: CardTipStyle.Minswk)
    private lazy var listLab: UILabel = UILabel.buildNormalTextLabel(APPLanguageInsTool.loadLanguage("mine_fun"), t_color: Primary_Color_Black, font: UIFont.systemFont(ofSize: 16))
    private lazy var contentVIew: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (jk_kScreenW - LAYOUT_MIN_UNIT * 11) * 0.5, height: (jk_kScreenW - LAYOUT_MIN_UNIT * 11) * 0.29)
        layout.minimumLineSpacing = LAYOUT_MIN_UNIT * 2.5
        layout.minimumInteritemSpacing = LAYOUT_MIN_UNIT * 2.5
        layout.sectionInset = UIEdgeInsets(top: 0, left: LAYOUT_MIN_UNIT * 4, bottom: 0, right: LAYOUT_MIN_UNIT * 4)
        let view = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.isScrollEnabled = false
        return view
    }()
    
    private var _source: [MineTransition] = []
    
    override func buildPageUI() {
        super.buildPageUI()
        
        self.title = APPLanguageInsTool.loadLanguage("mine_title")
        if let _text = GlobalCommonFile.shared.appLoginInfo?.issn {
            self.phoneslLab.text = APPLanguageInsTool.loadLanguage("cancel_wel_tip") + _text.maskPhoneNumber()
        }
        
        self.contentVIew.delegate = self
        self.contentVIew.dataSource = self
        self.contentVIew.register(MineCellsjeiViskwh.self, forCellWithReuseIdentifier: MineCellsjeiViskwh.className())
        
        self.basicScrollContentView.addSubview(self.headerism)
        self.basicScrollContentView.addSubview(self.phoneslLab)
        self.basicScrollContentView.addSubview(self.tipsView)
        self.basicScrollContentView.addSubview(self.listLab)
        self.basicScrollContentView.addSubview(self.contentVIew)
        
        self.basicScrollContentView.addMJRefresh { _ in
            self.pageNetRequest()
        }
        
        GlobalCommonFile.shared.addObserver(self, forKeyPath: LOGIN_OBERVER_KEY, context: nil)
        
        self.basicScrollContentView.refresh(begin: true)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let keyPath = keyPath, keyPath == LOGIN_OBERVER_KEY {
            if let _text = GlobalCommonFile.shared.appLoginInfo?.issn {
                self.phoneslLab.text = APPLanguageInsTool.loadLanguage("cancel_wel_tip") + _text.maskPhoneNumber()
            }
        }
    }

    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.headerism.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 5)
            make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 6 + jk_kNavFrameH)
            make.size.equalTo(57)
        }
        
        self.phoneslLab.snp.makeConstraints { make in
            make.centerY.equalTo(self.headerism)
            make.left.equalTo(self.headerism.snp.right).offset(LAYOUT_MIN_UNIT * 4)
            make.right.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 2)
        }
        
        self.tipsView.snp.makeConstraints { make in
            make.top.equalTo(self.headerism.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4)
            make.width.equalTo(jk_kScreenW - LAYOUT_MIN_UNIT * 8)
        }
        
        self.listLab.snp.makeConstraints { make in
            make.left.equalTo(self.tipsView)
            make.top.equalTo(self.tipsView.snp.bottom).offset(LAYOUT_MIN_UNIT * 4)
        }
        
        self.contentVIew.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.width.equalTo(self.view.width)
            make.top.equalTo(self.listLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 2.5)
            make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT)
            make.height.equalTo(400)
        }
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/katz", requestParams: [:])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _dict = res.jsonDict, let _models = MinepaheksModel.model(with: _dict) else {
                return
            }
            
            self?.basicScrollContentView.refresh(begin: false)
            if let _ms = _models.transitions {
                self?._source.removeAll()
                self?._source.append(contentsOf: _ms)
                self?.contentVIew.reloadData()
            }
            
        } failure: {[weak self] _, _ in
            self?.basicScrollContentView.refresh(begin: false)
        }
    }
}

extension ThirdMineswlViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self._source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let _cell = collectionView.dequeueReusableCell(withReuseIdentifier: MineCellsjeiViskwh.className(), for: indexPath) as? MineCellsjeiViskwh else {
            return UICollectionViewCell()
        }
        
        _cell.refreshMinsleCells(model: self._source[indexPath.item])
        
        return _cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let _url = self._source[indexPath.item].claude {
            LuYouTool.shared.gotoPage(pageUrl: _url, backtoRoot: true)
        }
    }
}
