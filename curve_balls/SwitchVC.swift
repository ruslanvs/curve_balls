//
//  SwitchVC.swift
//  curve_balls
//
//  Created by Ruslan Suvorov on 3/22/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit

class SwitchVC: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var switchElement: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchElement.isOn = false
        statusLabel.text = switchElement.isOn ? "The switch is on!" : "The switch is off!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func switchToggled(_ sender: UISwitch) {
        statusLabel.text = switchElement.isOn ? "The switch is on!" : "The switch is off!"
    }
}
