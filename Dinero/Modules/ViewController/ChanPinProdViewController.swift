//
//  ChanPinProdViewController.swift
//  Dinero
//
//  Created by 一刻 on 2025/9/4.
//

import UIKit

class ChanPinProdViewController: BasicViewController {

    private var id_number: String?
    
    init(withCommodityIDNumber idNumber: String) {
        super.init(nibName: nil, bundle: nil)
        self.id_number = idNumber
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
