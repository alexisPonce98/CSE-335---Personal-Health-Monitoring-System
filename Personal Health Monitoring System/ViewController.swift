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
        print("nope it came to view first")
        let realComp = self.cal.dateComponents(self.comp, from: self.date)
        let dateStr = "\(realComp.month!), \(realComp.day!) \(realComp.year!)"
        H = healthModel(manage: context)
        hFetch = (H?.fetch())!
        H?.clearData()
        if(fromAdd){
            if(returnSug != nil){
            if(self.returnOther == ""){
                H?.saveContext(day: dateStr, sys: self.returnSys!, dia: self.returnDia!, weigth: self.returnWeight!, sugar: self.returnSug!, other: "none")
            }else{
                H?.saveContext(day: dateStr, sys: self.returnSys!, dia: self.returnDia!, weigth: self.returnWeight!, sugar: self.returnSug!, other: self.returnOther!)
            }
            }else{
                let alert = UIAlertController(title: "Did not enter any data", message: "nothing was saved", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default){(action) in
                    
                }
                alert.addAction(action)
                self.present(alert,animated: true, completion: nil)
            }
        }
        hFetch = (H?.fetch())!
        for (index,val) in hFetch.enumerated(){
            print("\(val.systolicBloodPressure)")
        }
        
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        if segue.identifier == "viewHealth"{
            let next = segue.destination as? myHealthViewController
            self.hFetch = (self.H?.fetch())!
            var sendSys = [Int]()
            var sendDia = [Int]()
            var sendWeight = [Int]()
            var sendSug = [Int]()
            for (index,val) in hFetch.enumerated(){
                sendSys.append(Int(val.systolicBloodPressure))
                sendDia.append(Int(val.diostolicBloodPressure))
                sendWeight.append(Int(val.weight))
                sendSug.append(Int(val.sugarLevel))
            }
            next?.sys = sendSys
            next?.dia = sendDia
            next?.weight = sendWeight
            next?.sugar = sendSug
        }else if(segue.identifier == "amRisk"){
            let next = segue.destination as? riskViewController
            var sendSys = [Int]()
            var sendDia = [Int]()
            var sendWeight = [Int]()
            var sendSug = [Int]()
            for (index,val) in hFetch.enumerated(){
                sendSys.append(Int(val.systolicBloodPressure))
                sendDia.append(Int(val.diostolicBloodPressure))
                sendWeight.append(Int(val.weight))
                sendSug.append(Int(val.sugarLevel))
            }
            next?.sys = sendSys
            next?.dia = sendDia
            next?.weight = sendWeight
            next?.sugar = sendSug
        }
    }
    
    @IBAction func fromAddseg(segue:UIStoryboardSegue){
        print("it came to the unwind First")
        let seg = segue.source as? addViewController
        self.returnSys  = Int(seg!.getSys)
        self.returnDia = Int(seg!.getDia)
        self.returnSug = Int(seg!.sug)
        self.returnOther = seg!.getOther
        self.returnWeight = Int(seg!.getWeight)
        self.fromAdd = true
        self.viewDidLoad()
    }


}

