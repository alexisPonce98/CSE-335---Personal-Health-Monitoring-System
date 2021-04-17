//
//  addViewController.swift
//  Personal Health Monitoring System
//
//  Created by  on 4/16/21.
//  Copyright © 2021 Arizona State University. All rights reserved.
//

import UIKit

class addViewController: UIViewController {

    
    @IBOutlet weak var sys: UITextField!
    @IBOutlet weak var sugar: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var other: UITextField!
    @IBOutlet weak var dia: UITextField!
    var getSys:String = ""
    var sug:String = ""
    var getWeight:String = ""
    var getOther:String = ""
    var getDia:String = ""
    var noSymp = false
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        var checked = false
        var noSymp = false
        if(self.sys.text != ""){
            getSys = self.sys.text!
        }else{
            let alert = UIAlertController(title: "Forgot to enter your systolic boold pressure", message: "please check others", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default){(action) in
                checked = true
            }
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        if(self.dia.text != ""){
            getDia = self.dia.text!
            self.dia.text = ""
        }else{
            if(!checked){
                let alert = UIAlertController(title: "Forgot to enter your diastolic bool pressure", message: "pleas check others", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default){(action) in
                    checked = true
                }
                alert.addAction(action)
                self.present(alert, animated: true,completion: nil)
            }
        }
        if(self.weight.text != ""){
            sug = self.weight.text!
            self.weight.text = ""
        }else{
            if(!checked){
                let alert = UIAlertController(title: "Forgot to enter your weight", message: "Please check others", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default){(action) in
                    checked = true
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
        if(self.sugar.text != ""){
            getWeight = self.sugar.text!
            self.sugar.text = ""
        }else{
            if(!checked){
                let alert = UIAlertController(title: "Forgot to enter your sugar level", message: "Please check others", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default){(action) in
                    checked = true
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
        if(self.other.text != ""){
            getOther = self.other.text!
            self.other.text = ""
        }else{
            noSymp = true
        }
        checked = false
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "enterData"){
            let new = segue.description as? ViewController
            new?.fromAdd = true
            new?.returnSys = self.getSys
            new?.returnDia = self.getDia
            new?.returnWeight = self.getWeight
            new?.returnOther = self.getOther
            new?.returnSug = self.sug
            
        }
    }
    

}
