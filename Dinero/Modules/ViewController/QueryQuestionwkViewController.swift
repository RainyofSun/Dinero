//
//  QueryQuestionwkViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/8.
//

import UIKit

class QueryQuestionwkViewController: AuthBasicViewController {

    private lazy var tagleView: UITableView = {
        let view = UITableView(frame: CGRectZero, style: UITableView.Style.grouped)
        view.backgroundColor = UIColor.clear
        view.separatorStyle = .none
        return view
    }()
    
    private var _ques_arrsuw: [Memorization] = []
    private var _ques_mapwdl: [String: String] = [:]
    
    override func buildPageUI() {
        super.buildPageUI()
        
        self.basicScrollContentView.isHidden = true
        
        self.tagleView.register(QuestryQuestionTableViewCell.self, forCellReuseIdentifier: QuestryQuestionTableViewCell.className())
        self.tagleView.delegate = self
        self.tagleView.dataSource = self
        
        self.view.addSubview(self.tagleView)
    }
    
    override func layoutPageViews() {
        super.layoutPageViews()
        
        self.tagleView.snp.makeConstraints { make in
            make.horizontalEdges.top.equalToSuperview()
            make.bottom.equalTo(self.bottomsViwe.snp.top).offset(-LAYOUT_MIN_UNIT * 2)
        }
    }
    
    override func pageNetRequest() {
        super.pageNetRequest()
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/cfo", requestParams: ["conservative": self.pppp_sid])) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            guard let _jsowl = res.jsonDict, let _swlaowcs = QuestryQuestionModels.model(with: _jsowl), let _mems = _swlaowcs.memorization else {
                return
            }
            // 默认第一个打开
            _mems.first?.isExpand = true
            self?._ques_arrsuw.removeAll()
            self?._ques_arrsuw.append(contentsOf: _mems)
            self?.tagleView.reloadData()
        }
    }
    
    override func clickNextBusjwk(sender: APPActivityButton) {
        super.clickNextBusjwk(sender: sender)
        
        guard self._ques_arrsuw.count == self._ques_mapwdl.count else {
            self.view.makeToast(APPLanguageInsTool.loadLanguage("auth_ques_tip"))
            return
        }
        
        self._ques_mapwdl["conservative"] = self.pppp_sid
        
        APPNetRequestManager.afnReqeustType(NetworkRequestConfig.defaultRequestConfig("immediatelying/remedy", requestParams: self._ques_mapwdl)) {[weak self] (task: URLSessionDataTask, res: APPSuccessResponse) in
            // 问卷调查埋点
            BuryShuJuTool.riskControlRepoeri(type: TongJiEventUploadStyle.TJ_Query, beginTime: self?.buryingStartTime, endTime: Date().jk.dateToTimeStamp())
            self?.navigationController?.jk.popCurrentAndPush(vc: CardAuthswlawViewController(certificationTitle: self?._next_toelsl_map?[ChanPinAuthElement.Certif_ID_Cosujward], nextAuthTitle: self?._next_toelsl_map), animated: true)
        }
    }
}

extension QueryQuestionwkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._ques_arrsuw.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _cell = tableView.dequeueReusableCell(withIdentifier: QuestryQuestionTableViewCell.className(), for: indexPath) as? QuestryQuestionTableViewCell else {
            return UITableViewCell()
        }
        
        _cell.delelswsjw = self
        _cell.indexPasjw = indexPath
        _cell.reloadHeaderMdoes(models: self._ques_arrsuw[indexPath.row])
        
        return _cell
    }
}

extension QueryQuestionwkViewController: QuestiosnCellProtocol {
    func expandOrNotCell(inds: IndexPath) {
        self._ques_arrsuw[inds.row].isExpand = !self._ques_arrsuw[inds.row].isExpand
        self.tagleView.reloadRow(at: inds, with: UITableView.RowAnimation.fade)
    }
    
    func selectedQuesutiwonwms(marks: QuestryQuestionButonskw, indes: IndexPath) {
        guard let _cel_gov = marks.marks else {
            return
        }
        
        self._ques_arrsuw[indes.row].gov?[marks.tag - 1000] = _cel_gov
        if let _tel = self._ques_arrsuw[indes.row].tell {
            self._ques_mapwdl[_tel] = _cel_gov.lawrence
        }
        
        APPCocoaLog.debug("====== 问卷调查 ========\n ===== \(self._ques_mapwdl) ======== \n")
    }
}
