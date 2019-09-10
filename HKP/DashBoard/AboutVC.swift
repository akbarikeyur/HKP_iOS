//
//  AboutVC.swift
//  HKP
//
//  Created by Amisha on 26/12/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit

class AboutVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet var scrollview: UIScrollView!
    @IBOutlet var reportCollectionView: UICollectionView!
    @IBOutlet var reportCollectionViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reportCollectionView.register(UINib.init(nibName: "ReportDownloadCVC", bundle: nil), forCellWithReuseIdentifier: "ReportDownloadCVC")
        
    }
    //MARK: - Button Click
    
    @IBAction func clickToCollectWaste(_ sender: Any) {
        
    }
    
    //MARK: - CollectionView Delegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = reportCollectionView.dequeueReusableCell(withReuseIdentifier: "ReportDownloadCVC", for: indexPath) as! ReportDownloadCVC
  //      cell.imgView.image = UIImage(named: reportImgArr[indexPath.row])
        cell.subLbl.text = reportLbl[indexPath.row]
        cell.colorImgView.backgroundColor = colorFromHex(hex: reportcolor[indexPath.row])
        cell.colorImgView.alpha = 0.8
        reportCollectionViewHeightConstraint.constant = reportCollectionView.contentSize.height
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        let WIDTH = reportCollectionView.frame.size.width/2
        let HEIGHT = (WIDTH * 103) / 140
        return CGSize(width: WIDTH, height: HEIGHT)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }
    
}
