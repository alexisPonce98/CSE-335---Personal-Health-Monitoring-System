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
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(_ sender: Any) {
        
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
