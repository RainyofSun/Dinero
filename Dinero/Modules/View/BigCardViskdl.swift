//
//  BigCardViskdl.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/4.
//

import UIKit

class BigCardViskdl: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.image = UIImage(named: "home_bg")
        self.isUserInteractionEnabled = true
        self.contentMode = .scaleAspectFill
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
