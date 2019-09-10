//
//  ViewController.swift
//  HKP
//
//  Created by Amisha on 25/12/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit
import FSPagerView

class ViewController: UIViewController,FSPagerViewDataSource,FSPagerViewDelegate {
    
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.typeIndex = 3
        }
    }
    @IBOutlet var subLbl: Label!
    @IBOutlet var mainLbl: Label!
    @IBOutlet var backImg: UIImageView!
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var containerViewHeight: NSLayoutConstraint!
    
    var selectedIndex : Int = 2
    var navigationFlag : Bool = false
    
    var arr = ["Brands","Products","Home","About","Contact","Paper","Plastic"]
    let imageNames = ["tab_brand_gray","tab_product_gray","tab_home_gray","tab_about_gray","tab_contact_gray","tab_paper_grey","tab_plastic_grey"]
    let selectedImageNames = ["tab_brand_white","tab_product_white","tab_home_white","tab_about_white","tab_contact_white","tab_paper_white","tab_plastic_white"]
    
    var subLblArr = ["Keeping it clean by giving your waste \nTo professional company","Make your generations \nlive in a clean city","We're specialists in the \nplastic recycling processes.","keeping it clean by giving your \nwaste to professional company","We always try to serve better \nthan we are doing","Make your generations \nlive in a clean city","Keeping it clean by giving your waste \nTo professional company"]
    
    var mainLblArr = ["Plastic waste is a major \nreason for pollution.","Hkp mission is to keep \nSurroundings clean","Keep tour \nSurrounding clean","Keep tour \nSurrounding clean","Towards a cleaner \nTomorrow","Hkp mission is to \nSurroundings clean","Plastic waste is a major \nreason for pollution."]
    
    var backImgArr = ["19","18","4","about_bg","contact_bg","18","19"]
    
    fileprivate var typeIndex = 3 {
        didSet {
            self.pagerView.transformer = FSPagerViewTransformer(type:.linear)
            let transform = CGAffineTransform(scaleX: 0.30, y: 0.75)
            self.pagerView.itemSize = self.pagerView.frame.size.applying(transform)
        }
    }
    
    var homeVC : HomeVC!
    var aboutVC : AboutVC!
    var contactVC : ContactVC!
    var PaperVC : PaperVC!
    var PlasticVC : PlasticVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pagerView.register(UINib.init(nibName: "CustomCollectionCVC", bundle: nil), forCellWithReuseIdentifier: "CustomCollectionCVC")
        
        homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        aboutVC = storyboard?.instantiateViewController(withIdentifier: "AboutVC") as! AboutVC
        contactVC = storyboard?.instantiateViewController(withIdentifier: "ContactVC") as! ContactVC
        PaperVC = storyboard?.instantiateViewController(withIdentifier: "PaperVC") as! PaperVC
        PlasticVC = storyboard?.instantiateViewController(withIdentifier: "PlasticVC") as! PlasticVC
        
        scrollToSelectedPage(index: selectedIndex)
        delay(0.0) {
            self.pagerView.selectItem(at: self.selectedIndex, animated: false)
            self.pagerView.scrollToItem(at: self.selectedIndex, animated: false)
        }
        pagerView.reloadData()
    }
    
    // MARK:- FSPagerViewDataSource
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell : CustomCollectionCVC = pagerView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionCVC", at: index) as! CustomCollectionCVC
        if selectedIndex == index {
            cell.imgBtn.setImage(UIImage(named: self.selectedImageNames[index]), for: .normal)
            cell.outerView?.backgroundColor = AppColor
            cell.titleLbl?.textColor = WhiteColor
        } else {
            cell.imgBtn.setImage(UIImage(named: self.imageNames[index]), for: .normal)
            cell.outerView?.backgroundColor = WhiteColor
            cell.titleLbl?.textColor = DarkGrayColor
        }
        cell.titleLbl?.text = arr[index]
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        if selectedIndex != index
        {
            subLbl.text = subLblArr[index]
            mainLbl.text = mainLblArr[index]
            backImg.image = UIImage(named: backImgArr[index])
            
            removeOldView(index: selectedIndex)
            selectedIndex = index
            pagerView.selectItem(at: selectedIndex, animated: true)
            pagerView.scrollToItem(at: selectedIndex, animated: true)
            delay(0.2) {
                self.scrollToSelectedPage(index: self.selectedIndex)
            }
            pagerView.reloadData()
        }
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        if selectedIndex != targetIndex
        {
            subLbl.text = subLblArr[targetIndex]
            mainLbl.text = mainLblArr[targetIndex]
            backImg.image = UIImage(named: backImgArr[targetIndex])
            
            removeOldView(index: selectedIndex)
            selectedIndex = targetIndex
            
            pagerView.selectItem(at: selectedIndex, animated: true)
            pagerView.scrollToItem(at: selectedIndex, animated: true)
            self.scrollToSelectedPage(index: self.selectedIndex)
            
            delay(0.5) {
                pagerView.reloadData()
            }
            
        }
    }
    
    func scrollToSelectedPage(index : Int)
    {
        switch index {
        case 0:
            containerViewHeight.constant = 0
            break
        case 1:
            containerViewHeight.constant = 0
            break
        case 2:
            displaySubViewtoParentView(containerView, subview: homeVC.view)
            displaySubViewWithScaleOutAnim(homeVC.view)
            containerViewHeight.constant = homeVC.scrollview.contentSize.height
            break
        case 3:
            displaySubViewtoParentView(containerView, subview: aboutVC.view)
            displaySubViewWithScaleOutAnim(aboutVC.view)
            containerViewHeight.constant = aboutVC.scrollview.contentSize.height
            break
        case 4:
            displaySubViewtoParentView(containerView, subview: contactVC.view)
            displaySubViewWithScaleOutAnim(contactVC.view)
            containerViewHeight.constant = contactVC.outerView.bounds.size.height
            break
        case 5:
            displaySubViewtoParentView(containerView, subview: PaperVC.view)
            displaySubViewWithScaleOutAnim(PaperVC.view)
            containerViewHeight.constant = PaperVC.scrollview.contentSize.height
            break
        case 6:
            displaySubViewtoParentView(containerView, subview: PlasticVC.view)
            displaySubViewWithScaleOutAnim(PlasticVC.view)
            containerViewHeight.constant = PlasticVC.scrollview.contentSize.height
            break
        default:
            break
        }
    }
    
    func removeOldView(index : Int)
    {
        switch index {
        case 0:
            break
        case 1:
            break
        case 2:
            displaySubViewWithScaleInAnim(homeVC.view)
            break
        case 3:
            displaySubViewWithScaleInAnim(aboutVC.view)
            break
        case 4:
            displaySubViewWithScaleInAnim(contactVC.view)
            break
        case 5:
            displaySubViewWithScaleInAnim(PaperVC.view)
            break
        case 6:
            displaySubViewWithScaleInAnim(PlasticVC.view)
            break
        default:
            break
        }
//        containerViewHeight.constant = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



