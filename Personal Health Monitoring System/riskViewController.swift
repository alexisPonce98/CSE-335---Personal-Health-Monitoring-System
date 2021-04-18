//
//  riskViewController.swift
//  Personal Health Monitoring System
//
//  Created by  on 4/16/21.
//  Copyright © 2021 Arizona State University. All rights reserved.
//

import UIKit

class riskViewController: UIViewController {
    var sys = [Int]()
    var dia = [Int]()
    var weight = [Int]()
    var sugar = [Int]()
    
    @IBOutlet weak var bloodText: UITextView!
    @IBOutlet weak var sugarText: UITextView!
    @IBOutlet weak var weightText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for (index,val) in self.weight.enumerated(){
            print(val)
        }
        calculate()
        // Do any additional setup after loading the view.
    }
    
    func calculate(){
        var firstAvg = 0
        var secondAvg = 0
        var firstSug = 0
        var secondSug = 0
        var none = true
        for (index,val) in self.weight.enumerated(){
            if(index <= 2){
                firstAvg = firstAvg+val
            }else if(index >= 3 || index <= 6){
                secondAvg = secondAvg + val
            }
        }
        firstAvg = firstAvg/3
        secondAvg = secondAvg/4
        if secondAvg > firstAvg{
            self.weightText.text = "Your are gaining weight!"
            none = false
        }
        for (index,val) in self.sugar.enumerated(){
            if(index == self.sugar.count-1){
                secondSug = val
            }else if(index == self.sugar.count-2){
                firstSug = val
            }
        }
        var perc = Double(firstSug) * 0.10
        print("\(perc) is the percentage with \(firstSug) being the first sug and \(perc + Double(firstSug)) being added and compared to \(secondSug)")
        if(Int((perc + Double(firstSug))) < secondSug){
            self.sugarText.text = "Your sugar level is high!"
            none = false
        }
        var firstSys = 0
        var secondSys = 0
        for (index,val) in self.sys.enumerated(){
            if index == self.sys.count-1{
                secondSys = val
            }
            else if index == self.sys.count-2{
                firstSys = val
            }
        }
        var percSys = Double(firstSys) * 0.10
        print("\(percSys) is ther percentage value of the sys being \(firstSys) with \(percSys + Double(firstSys)) being what is added then compared to \(secondSys)")
        if(Int(perc + Double(firstSys)) < secondSys){
            self.bloodText.text = "Your blood pressure is high!"
            none = false
        }
        var firstDia = 0
        var secondDia = 0
        for (index,val) in self.dia.enumerated(){
            if(index == self.dia.count-1){
                secondDia = val
            }else if(index == self.dia.count-2){
                firstDia = val
            }
        }
        var percDia = Double(firstDia) * 0.10
        print("\(percDia) is the percentage value of the dia \(firstDia) with \(percDia + Double(firstDia)) being what is added then compared to \(secondDia)")
        if(Int(percDia + Double(firstDia)) < secondDia){
            self.bloodText.text = "Your blood pressure is high!"
            none = false
        }
        if(none){
            let alert = UIAlertController(title: "You are in good health, keep up the good work", message: "😁", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default){(action) in
                self.weightText.text = "Dont worry about it, you are beautiful"
                self.bloodText.text = "Your hearts happy"
                self.sugarText.text = "Great job staying off the sweets"
            }
            alert.addAction(action)
            self.present(alert,animated: true, completion: nil)
        }
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
