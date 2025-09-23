//
//  SecondOrdViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/1.
//

import UIKit

class SecondOrdViewController: BasicViewController {

    private lazy var tipslwjdiemView: CardTipImsjlerifView = CardTipImsjlerifView(frame: CGRectZero, style: CardTipStyle.Ordeskw)
    private lazy var listLab: UILabel = UILabel.buildNormalTextLabel(APPLanguageInsTool.loadLanguage("order_enklw"), t_color: Primary_Color_Black, font: UIFont.systemFont(ofSize: 16))
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
    
    private var _order_sourewsk: [MineTransition] = []
    
    override func buildPageUI() {
        super.buildPageUI()
        self.title = APPLanguageInsTool.loadLanguage("order_title")
        
        self.contentVIew.delegate = self
        self.contentVIew.dataSource = self
        self.contentVIew.register(MineCellsjeiViskwh.self, forCellWithReuseIdentifier: MineCellsjeiViskwh.className())
        
        self.basicScrollContentView.addSubview(self.tipslwjdiemView)
        self.basicScrollContentView.addSubview(self.listLab)
        self.basicScrollContentView.addSubview(self.contentVIew)
        
        for i in 0..<3 {
            let item = MineTransition()
            if i == .zero {
                item.maria = "order_img"
                item.gendered = APPLanguageInsTool.loadLanguage("order_apply")
                item.claude = APP_Order_list + "?num=7"
            } else if i == 1 {
                item.maria = "order_repay"
                item.gendered = APPLanguageInsTool.loadLanguage("order_repay")
                item.claude = APP_Order_list + "?num=6"
            } else {
                item.maria = "order_com"
                item.gendered = APPLanguageInsTool.loadLanguage("order_finis")
                item.claude = APP_Order_list + "?num=5"
            }
            _order_sourewsk.append(item)
        }
        
        self.contentVIew.reloadData()
    }

    override func layoutPageViews() {
        super.layoutPageViews()
        self.tipslwjdiemView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4)
            make.width.equalTo(jk_kScreenW - LAYOUT_MIN_UNIT * 8)
            make.top.equalToSuperview().offset(LAYOUT_MIN_UNIT * 4 + jk_kNavFrameH)
        }
        
        self.listLab.snp.makeConstraints { make in
            make.left.equalTo(self.tipslwjdiemView)
            make.top.equalTo(self.tipslwjdiemView.snp.bottom).offset(LAYOUT_MIN_UNIT * 4)
        }
        
        self.contentVIew.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(self.listLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
            make.width.equalTo(self.view.width)
            make.height.equalTo(300)
        }
    }
}

extension SecondOrdViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self._order_sourewsk.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let _cell = collectionView.dequeueReusableCell(withReuseIdentifier: MineCellsjeiViskwh.className(), for: indexPath) as? MineCellsjeiViskwh else {
            return UICollectionViewCell()
        }
        
        _cell.refreshMinsleCells(model: self._order_sourewsk[indexPath.item])
        
        return _cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let _url = self._order_sourewsk[indexPath.item].claude {
            LuYouTool.shared.gotoPage(pageUrl: _url, backtoRoot: true)
        }
    }
}
