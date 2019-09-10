//
//  CollectWasteVC.swift
//  HKP
//
//  Created by Amisha on 26/12/18.
//  Copyright © 2018 Amisha. All rights reserved.
//

import UIKit
import DropDown

class CollectWasteVC: UIViewController {

    @IBOutlet var titleLbl: Label!
    @IBOutlet var nameTxt: TextField!
    @IBOutlet var numberTxt: TextField!
    @IBOutlet var emailTxt: TextField!
    @IBOutlet var collectionTxt: TextField!
    @IBOutlet var dateTxt: TextField!
    @IBOutlet var timeTxt: TextField!
    @IBOutlet var weightTxt: TextField!
    @IBOutlet var addressTextView: TextView!
    
    var selectedDate : Date!
    var isPaper : Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isPaper
        {
            titleLbl.text = "Collect Paper Waste"
        }
        else{
            titleLbl.text = "Collect Plastic Waste"
        }
        
    }
    
    //MARK: - Button Click
    
    @IBAction func clickToCollection(_ sender: UIButton) {
        let dropDown = DropDown()
        dropDown.anchorView = sender
        dropDown.dataSource = collectionOfItem
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.collectionTxt.text = collectionOfItem[index]
        }
        dropDown.show()
    }
    @IBAction func clickToDate(_ sender: Any) {
        self.view.endEditing(true)
        if selectedDate == nil
        {
            selectedDate = Date()
        }
        let maxDate : Date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!
        DatePickerManager.shared.showPicker(title: "select_dob", selected: selectedDate, min: Date(), max: nil) { (date, cancel) in
            if !cancel && date != nil {
                self.selectedDate = date!
                self.dateTxt.text = getDateStringFromDate(date: self.selectedDate)
                
//                let components : DateComponents = Calendar.current.dateComponents([.year,.month,.day], from: self.selectedDate)
//                self.yearTxt.text = String(components.year!)
//                self.monthTxt.text = String(components.month!)
//                self.dateTxt.text = String(components.day!)
//                self.dobBtn.setTitle(getDateStringFromDate(date: self.selectedDate), for: .normal)
            }
        }
    }
    @IBAction func clickToTime(_ sender: Any) {
        self.view.endEditing(true)
        if selectedDate == nil
        {
            selectedDate = Date()
        }
        DatePickerManager.shared.showPickerForTime(title: "Select Time", selected: selectedDate, min: Date(), max: nil) { (date, cancel) in
             if !cancel && date != nil {
                self.timeTxt.text = getTimeStringFromServerTimeStemp(getTimestampFromDate(date: date!))
             }
        }
            
            
        
        
    }
    @IBAction func clickToSubmit(_ sender: Any) {
        
    }
    
    @IBAction func clickToBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        
        
    }
 
}
