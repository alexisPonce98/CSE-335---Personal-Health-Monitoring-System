//
//  ViewController.swift
//  Personal Health Monitoring System
//
//  Created by  on 4/15/21.
//  Copyright © 2021 Arizona State University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var returnSys:String?
    var returnDia:String?
    var returnWeight:String?
    var returnSug:String?
    var returnOther:String?
    var fromAdd = false
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var H:healthModel?
    var hFetch = [Health]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        H = healthModel(manage: context)
        hFetch = H?.fetch()
        
        // Do any additional setup after loading the view.
    }


}

