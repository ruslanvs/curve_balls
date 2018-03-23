//
//  DatePickerVC.swift
//  curve_balls
//
//  Created by Ruslan Suvorov on 3/22/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit

class DatePickerVC: UIViewController {

    @IBOutlet weak var shortDateLabel: UILabel!
    @IBOutlet weak var mediumDateLabel: UILabel!
    @IBOutlet weak var longDateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func datePickerSet(_ sender: UIDatePicker) {
        dates()
    }
    
    func dates(){
        let shortDate = DateFormatter()
        let mediumDate = DateFormatter()
        let longDate = DateFormatter()
        
        shortDate.dateFormat = "MM/dd/yyyy"
        mediumDate.dateFormat = "MMM d, yyyy"
        longDate.dateFormat = "MMMM d, yyyy"
        
        shortDateLabel.text = shortDate.string( from: datePicker.date )
        mediumDateLabel.text = mediumDate.string( from: datePicker.date )
        longDateLabel.text = longDate.string( from: datePicker.date )
    }
}
