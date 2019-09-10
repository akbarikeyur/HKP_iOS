//
//  ContactVC.swift
//  HKP
//
//  Created by Amisha on 26/12/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit

class ContactVC: UIViewController {

    @IBOutlet var outerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickToGetDirection(_ sender: Any) {
        
    }
    
    @IBAction func clickToCollectPaper(_ sender: Any) {
        let vc : CollectWasteVC = self.storyboard?.instantiateViewController(withIdentifier: "CollectWasteVC") as! CollectWasteVC
        vc.isPaper = true
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func clickToCollectPlastic(_ sender: Any) {
        let vc : CollectWasteVC = self.storyboard?.instantiateViewController(withIdentifier: "CollectWasteVC") as! CollectWasteVC
        vc.isPaper = false
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  }
