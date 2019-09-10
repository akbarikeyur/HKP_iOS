//
//  A4PaperVC.swift
//  HKP
//
//  Created by Amisha on 02/01/19.
//  Copyright © 2019 Amisha. All rights reserved.
//

import UIKit

class A4PaperVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
