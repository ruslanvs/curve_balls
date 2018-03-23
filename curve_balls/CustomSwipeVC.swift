//
//  CustomSwipeVC.swift
//  curve_balls
//
//  Created by Ruslan Suvorov on 3/22/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit
import CoreData

class CustomSwipeVC: UIViewController {
    
    var result = [Character]()

    var managedObjectContext = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    var appDelegate = ( UIApplication.shared.delegate as! AppDelegate )

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
//        seedData()
        fetchAll()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func seedData(){
        let characters = ["Batman", "Mario", "Torn", "Fireball", "Aqua"]    
        for c in characters {
            let item = NSEntityDescription.insertNewObject(forEntityName: "Character", into: managedObjectContext) as! Character
            item.name = c
            appDelegate.saveContext()
        }
        fetchAll()
    }
    
    func fetchAll(){
        let request = NSFetchRequest<NSFetchRequestResult>( entityName: "Character" )
        do {
            result = try managedObjectContext.fetch( request ) as! [Character]
        } catch {
            print( error )
        }
    }
    
    
}

extension CustomSwipeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
//        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! SwipeTableViewCell
        
        if let data = result[indexPath.row].name {
            cell.textLabel?.text = data
        }
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete"){
            (action, indexPath) in print( "delete in: \(indexPath.row)")
        }
        let share = UITableViewRowAction(style: .normal, title: "Disable"){
            (action, indexPath) in print( "share in: \(indexPath.row)")
        }
        share.backgroundColor = UIColor.blue
        print([delete, share])
        return [delete, share]
    }

//    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
//        var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: {(action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in})
//    }
    
}

//extension CustomSwipeVC: SwipeTableViewCellDelegate

