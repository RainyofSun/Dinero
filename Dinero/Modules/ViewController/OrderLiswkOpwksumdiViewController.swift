//
//  OrderLiswkOpwksumdiViewController.swift
//  Dinero
//
//  Created by Yu Chen  on 2025/9/7.
//

import UIKit
import EmptyDataSet_Swift

class OrderLiswkOpwksumdiViewController: BasicViewController {

    private lazy var tableLishwksorj: UITableView = {
        let view = UITableView(frame: CGRectZero, style: UITableView.Style.plain)
        view.showsVerticalScrollIndicator = false
        view.separatorStyle = .none
        view.backgroundColor = .clear
        return view
    }()
    
    private var list_id: String?
    private var list_skwmnfue: [OrderTransition] = []
    
    init(withOrdkekLstIDNumber idNumber: String) {
        super.init(nibName: nil, bundle: nil)
        self.list_id = idNumber
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        self.pageNetRequest()
    }

    override func buildPageUI() {
        super.buildPageUI()
        self.gradientView.isHidden = true
        self.basicScrollContentView.isHidden = true
        
        if let _id = self.list_id {
            if _id == "5" {
                self.title = APPLanguageInsTool.loadLanguage("order_finis")
            }
            
            if _id == "6" {
                self.title = APPLanguageInsTool.loadLanguage("order_apply")
            }
            
            if _id == "7" {
                self.title = APPLanguageInsTool.loadLanguage("order_repay")
            }
        }
        
        self.tableLishwksorj.addMJRefresh {[weak self] _ in
            self?.pageNetRequest()
        }
        self.tableLishwksorj.register(OrderLiswkOpwksuTableViewCell.self, forCellReuseIdentifier: OrderLiswkOpwksuTableViewCell.className())
        self.tableLishwksorj.emptyDataSetDelegate = self
        self.tableLishwksorj.emptyDataSetSource = self
        
        self.tableLishwksorj.delegate = self
        self.tableLishwksorj.dataSource = self
        self.view.addSubview(self.tableLishwksorj)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.tableLishwksorj.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(jk_kNavFrameH + LAYOUT_MIN_UNIT * 1.5)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        guard let _id = self.list_id else {
            return
        }
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/lawrence", requestParams: ["tank": _id])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            self?.tableLishwksorj.refresh(begin: false)
            guard let _dd = res.jsonDict, let _molsw = OrderLiswkOpwksumdiModel.model(with: _dd), let _tea = _molsw.transitions else {
                return
            }
            
            self?.list_skwmnfue.removeAll()
            self?.list_skwmnfue.append(contentsOf: _tea)
            self?.tableLishwksorj.reloadData()
            
        } failure: {[weak self] _, _ in
            self?.tableLishwksorj.refresh(begin: false)
        }
    }
}

extension OrderLiswkOpwksumdiViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list_skwmnfue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _cell = tableView.dequeueReusableCell(withIdentifier: OrderLiswkOpwksuTableViewCell.className(), for: indexPath) as? OrderLiswkOpwksuTableViewCell else {
            return UITableViewCell()
        }
        
        _cell.refskrmOrdslwCellmodls(modls: self.list_skwmnfue[indexPath.row])
        
        return _cell
    }
}

extension OrderLiswkOpwksumdiViewController: EmptyDataSetDelegate, EmptyDataSetSource {

    func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return UIImage(named: "order_empty")
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return NSAttributedString(string: APPLanguageInsTool.loadLanguage("order_empty"), attributes: [.foregroundColor: Primary_Color_Black, .font: UIFont.interFont(size: 14, fontStyle: InterFontWeight.Regular)])
    }
    
    func emptyDataSetShouldAllowScroll(_ scrollView: UIScrollView) -> Bool {
        return true
    }
}
