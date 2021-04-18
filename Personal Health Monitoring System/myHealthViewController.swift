//
//  myHealthViewController.swift
//  Personal Health Monitoring System
//
//  Created by  on 4/16/21.
//  Copyright © 2021 Arizona State University. All rights reserved.
//

import UIKit

class myHealthViewController: UIViewController {
    var sys = [Int]()
    var dia = [Int]()
    var weight = [Int]()
    var sugar = [Int]()
    
    @IBOutlet weak var sysText: UITextView!
    @IBOutlet weak var weightText: UITextView!
    @IBOutlet weak var sugarText: UITextView!
    @IBOutlet weak var diaText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for (index,val) in sys.enumerated(){
            print(val)
        }
        for (index,val) in dia.enumerated(){
            print(val)
        }
        for (index,val) in weight.enumerated(){
            print(val)
        }
        for (index,val) in sugar.enumerated(){
            print(val)
        }
        showHealth()
        // Do any additional setup after loading the view.
    }
    
    func showHealth(){
        self.sysText.text = ""
        self.diaText.text = ""
        self.weightText.text = ""
        self.sugarText.text = ""
        for (index, val) in self.sys.enumerated(){
            self.sysText.text += "\(String(val)) \n"
        }
        for (index,val) in self.dia.enumerated(){
            self.diaText.text += "\(String(val)) \n"
        }
        for (index,val) in self.weight.enumerated(){
            self.sugarText.text += "\(String(val)) \n"
        }
        for (index,val) in self.sugar.enumerated(){
            self.weightText.text += "\(String(val)) \n"
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
