//
//  SectionsVC.swift
//  curve_balls
//
//  Created by Ruslan Suvorov on 3/25/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit

class SectionsVC: UIViewController {
    
    let sectionTitles = ["Favorite Quotes", "Quote Bank"]
    var sectionHeaders = ["favorite", "bank"]
    
    var quotes: [String: [String]] = [
        "favorite":
                [
                    "Get stuff done",
                    "Do not talk, do"
        ],
        "bank": [
            "Hope for the best, but be ready to kik the worst's ass"
        ]
    ]

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaders.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = sectionTitles[section]
        return title
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

extension SectionsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let header = sectionHeaders[section]
        return quotes[header]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath)
        
        let header = sectionHeaders[indexPath.section]
        cell.textLabel?.text = quotes[header]?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let sectionHeader = sectionHeaders[indexPath.section]
        let anotherSectionHeader = (sectionHeaders[indexPath.section] == "bank") ? "favorite" : "bank"
        let anotherSection = (indexPath.section == 0) ? 1 : 0
        
        var anotherIndexPath = indexPath
        anotherIndexPath.section = anotherSection
        anotherIndexPath.row = (quotes[anotherSectionHeader]?.count)!
        
        //>> Eli: check this out...
        let item = quotes[sectionHeader]?.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        quotes[anotherSectionHeader]?.append( item! )
        tableView.insertRows(at: [anotherIndexPath], with: .automatic)
        
    }
}
























