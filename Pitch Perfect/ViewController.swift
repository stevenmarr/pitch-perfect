//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Steven Marr on 12/6/14.
//  Copyright (c) 2014 Steven Marr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet weak var recLabel: UILabel!
    
    
    @IBAction func recordButton(sender: UIButton) {
        // Add "Recording..." text
        recLabel.hidden = false
        
        //TODO: Create New Recording
    }

    @IBAction func stopRec(sender: UIButton) {
        recLabel.hidden = true
        //TODO: Stop Recording
    }
}

