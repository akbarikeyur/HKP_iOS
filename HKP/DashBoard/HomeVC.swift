//
//  HomeVC.swift
//  HKP
//
//  Created by PC on 26/12/18.
//  Copyright © 2018 PC. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var scrollview: UIScrollView!
    @IBOutlet var newsCollectionView: UICollectionView!
    @IBOutlet var newsCollectionViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var productsTblView: UITableView!
    @IBOutlet var productTblHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var reportCollectionView: UICollectionView!
    @IBOutlet var reportCollectionViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var blogTblView: UITableView!
    @IBOutlet var blogTblHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet var partnerCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsCollectionView.register(UINib.init(nibName: "CustomNewsCVC", bundle: nil), forCellWithReuseIdentifier: "CustomNewsCVC")
        reportCollectionView.register(UINib.init(nibName: "ReportDownloadCVC", bundle: nil), forCellWithReuseIdentifier: "ReportDownloadCVC")
        
        blogTblView.register(UINib.init(nibName: "BlogsTVC", bundle: nil), forCellReuseIdentifier: "BlogsTVC")
        
        productsTblView.register(UINib.init(nibName: "CustomProductBrandTVC", bundle: nil), forCellReuseIdentifier: "CustomProductBrandTVC")
        
        blogTblView.reloadData()
        blogTblHeightConstraint.constant = blogTblView.contentSize.height
        
        newsCollectionView.reloadData()
        newsCollectionViewHeightConstraint.constant = (newsCollectionView.frame.size.width/2.5) + 70
        
        productsTblView.reloadData()
        productTblHeightConstraint.constant = productsTblView.contentSize.height
    }
    
    //MARK: - CollectionView Delegate
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == newsCollectionView {
            return 3
        }else if collectionView == reportCollectionView {
            return 4
        }else {
            return 4
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == newsCollectionView {
            let cell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: "CustomNewsCVC", for: indexPath) as! CustomNewsCVC
            cell.imgBtn.layer.cornerRadius = 10
            cell.imgBtn.layer.masksToBounds = true
  //          cell.imgBtn.setImage(UIImage(named: newsImgArr[indexPath.row]), for: .normal)
            newsCollectionViewHeightConstraint.constant = (newsCollectionView.frame.size.width/2.5) + 70
            return cell
        } else if collectionView == reportCollectionView {
            let cell = reportCollectionView.dequeueReusableCell(withReuseIdentifier: "ReportDownloadCVC", for: indexPath) as! ReportDownloadCVC
 //           cell.imgView.image = UIImage(named: reportImgArr[indexPath.row])
            cell.subLbl.text = reportLbl[indexPath.row]
            cell.colorImgView.backgroundColor = colorFromHex(hex: reportcolor[indexPath.row])
            cell.colorImgView.alpha = 0.8
            reportCollectionViewHeightConstraint.constant = reportCollectionView.contentSize.height
            return cell
        }
        else {
            let cell = partnerCollectionView.dequeueReusableCell(withReuseIdentifier: "PartnerCVC", for: indexPath) as! PartnerCVC
            cell.imgBtn.setImage(UIImage(named: PartnerImg[indexPath.row]), for: .normal)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == newsCollectionView {
            let WIDTH = newsCollectionView.frame.size.width/2.5
            let HEIGHT = WIDTH + 70
            return CGSize(width: WIDTH, height: HEIGHT)
        }
        else if collectionView == reportCollectionView {
            let WIDTH = reportCollectionView.frame.size.width/2
            let HEIGHT = (WIDTH * 103) / 140
            return CGSize(width: WIDTH, height: HEIGHT)
        }
            
        else {
            let WIDTH = partnerCollectionView.frame.size.width/2.3
            let HEIGHT = partnerCollectionView.frame.size.height
            return CGSize(width: WIDTH, height: HEIGHT)
            
        }
        
    }
    
    //MARK: - Tableview Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == productsTblView {
            return 2
        }else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == productsTblView {
            return 228
        }else {
            return 71
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == productsTblView {
            let cell = productsTblView.dequeueReusableCell(withIdentifier: "CustomProductBrandTVC", for: indexPath) as! CustomProductBrandTVC
            
            let mainLblArr = ["OUR COMPANY IS A HIGHLY SOUGHT\nAFTER A4 PAPER SUPPLIER IN DUBAI","WE ARE AN EMERGING MAKER OF HIGH \nQUALITY FACIAL TISSUE IN DUBAI"]
            let subLblArr = ["It is fairly apparent that several offices, if not all,\nemploy a supplier in one capacityor the other.....","HKP Paper Solutions is a diverse company producing several finished products involving the use of paper......."]
            
            cell.mainLbl.text = mainLblArr[indexPath.row]
            cell.subLbl.text = subLblArr[indexPath.row]
            
            productTblHeightConstraint.constant = productsTblView.contentSize.height
            return cell
        }else {
            let cell = blogTblView.dequeueReusableCell(withIdentifier: "BlogsTVC", for: indexPath) as! BlogsTVC

            blogTblHeightConstraint.constant = blogTblView.contentSize.height
            return cell
        }
  
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == productsTblView {
            if indexPath.row == 0 {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "A4PaperVC") as! A4PaperVC
                UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
            }else {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "FacialPaperVC") as! FacialPaperVC
                UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

class PartnerCVC: UICollectionViewCell {
    
    @IBOutlet var imgBtn: UIButton!
    
}
