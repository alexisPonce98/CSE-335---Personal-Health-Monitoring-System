//
//  ViewController.swift
//  Personal Health Monitoring System
//
//  Created by  on 4/15/21.
//  Copyright © 2021 Arizona State University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var returnSys:Int?
    var returnDia:Int?
    var returnWeight:Int?
    var returnSug:Int?
    var returnOther:String?
    var fromAdd = false
    let date = Date()
    let cal = Calendar.current
    let comp: Set<Calendar.Component> = [
    .year,
    .month,
    .day,
    .hour,
    .minute,
    .second
    ]
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var H:healthModel?
    var hFetch = [Health]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realComp = self.cal.dateComponents(self.comp, from: self.date)
        let dateStr = "\(realComp.month!), \(realComp.day!) \(realComp.year!)"
        H = healthModel(manage: context)
        hFetch = (H?.fetch())!
        if(fromAdd){
            if(self.returnOther == ""){
                H?.saveContext(day: dateStr, sys: self.returnSys!, dia: self.returnDia!, weigth: self.returnWeight!, sugar: self.returnSug!, other: "none")
            }else{
                H?.saveContext(day: dateStr, sys: self.returnSys!, dia: self.returnDia!, weigth: self.returnWeight!, sugar: self.returnSug!, other: self.returnOther!)
            }
        }
        hFetch = (H?.fetch())!
        for (index,val) in hFetch.enumerated(){
            print("\(val.systolicBloodPressure)")
        }
        
        // Do any additional setup after loading the view.
    }


}

