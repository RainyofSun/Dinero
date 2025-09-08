//
//  QuestryQuestionTableViewCell.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/8.
//

import UIKit

protocol QuestiosnCellProtocol: AnyObject {
    func expandOrNotCell(inds: IndexPath)
}

class QuestryQuestionTableViewCell: UITableViewCell {
    
    open var indexPasjw: IndexPath?
    weak open var delelswsjw: QuestiosnCellProtocol?
    
    private lazy var whiskrBgView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = .white
        view.corner(16)
        return view
    }()
    
    private lazy var headerjkikbnjh: QuestryQuestionHeader = QuestryQuestionHeader(frame: CGRectZero, isExpand: false)
    private lazy var questtilsLab: UILabel = UILabel.buildNormalTextLabel("", t_color: UIColor.hexStringColor(hexString: "#202020"), font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.medium))
    private lazy var chooseskfkdView: UIView = UIView(frame: CGRectZero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.headerjkikbnjh.addTarget(self, action: #selector(clickHesjwje(sender: )), for: UIControl.Event.touchUpInside)
        
        self.contentView.addSubview(self.whiskrBgView)
        self.whiskrBgView.addSubview(self.headerjkikbnjh)
        self.whiskrBgView.addSubview(self.questtilsLab)
        self.whiskrBgView.addSubview(self.chooseskfkdView)
        
        self.whiskrBgView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 4)
            make.verticalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 2)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func clickHesjwje(sender: UIControl) {
        guard let _inde = self.indexPasjw else {
            return
        }
        
        self.delelswsjw?.expandOrNotCell(inds: _inde)
    }
    
    func reloadHeaderMdoes(models: Memorization) {
        self.questtilsLab.text = models.gendered
        
        self.questtilsLab.isHidden = !models.isExpand
        self.chooseskfkdView.isHidden = self.questtilsLab.isHidden
        
        UIView.animate(withDuration: 0.3) {
            if models.isExpand {
                self.headerjkikbnjh.snp.remakeConstraints { make in
                    make.horizontalEdges.equalToSuperview()
                    make.top.equalToSuperview()
                }
                
                self.questtilsLab.snp.remakeConstraints { make in
                    make.horizontalEdges.equalToSuperview().inset(LAYOUT_MIN_UNIT * 4)
                    make.top.equalTo(self.headerjkikbnjh.snp.bottom)
                }
                
                self.chooseskfkdView.snp.remakeConstraints { make in
                    make.top.equalTo(self.questtilsLab.snp.bottom).offset(LAYOUT_MIN_UNIT * 3)
                    make.horizontalEdges.equalTo(self.questtilsLab)
                    make.bottom.equalToSuperview().offset(-LAYOUT_MIN_UNIT * 4)
                }
                
                if let _chs = models.gov {
                    self.buildQuestionchsow(models: _chs)
                }
            } else {
                self.headerjkikbnjh.snp.remakeConstraints { make in
                    make.horizontalEdges.equalToSuperview()
                    make.verticalEdges.equalToSuperview()
                }
            }
        }
    }
}

private extension QuestryQuestionTableViewCell {
    func buildQuestionchsow(models: [Gov]) {
        self.chooseskfkdView.removeAllSubviews()
        
        var _tosp_viwes: QuestryQuestionButonskw?
        models.enumerated().forEach { (index: Int, item: Gov) in
            let view = QuestryQuestionButonskw(frame: CGRectZero)
            view.tilsLab.text = item.rans
            view.marks = item.lawrence
            view.tag = 1000 + index
            self.chooseskfkdView.addSubview(view)
            
            if let _top = _tosp_viwes {
                if index == models.count - 1 {
                    view.snp.makeConstraints { make in
                        make.horizontalEdges.equalTo(_top)
                        make.top.equalTo(_top.snp.bottom).offset(LAYOUT_MIN_UNIT * 2)
                        make.bottom.equalToSuperview()
                    }
                } else {
                    view.snp.makeConstraints { make in
                        make.horizontalEdges.equalToSuperview()
                        make.top.equalTo(_top.snp.bottom).offset(LAYOUT_MIN_UNIT * 2)
                    }
                }
            } else {
                view.snp.makeConstraints { make in
                    make.horizontalEdges.top.equalToSuperview()
                }
            }
            
            _tosp_viwes = view
        }
    }
}
