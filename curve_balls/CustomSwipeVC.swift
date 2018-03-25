//
//  CustomSwipeVC.swift
//  curve_balls
//
//  Created by Ruslan Suvorov on 3/22/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

//import UIKit
//import CoreData
//
//class CustomSwipeVC: UIViewController {
//    
//    var result = [Character]()
//
//    var managedObjectContext = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
//    var appDelegate = ( UIApplication.shared.delegate as! AppDelegate )
//
//    @IBOutlet weak var tableView: UITableView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.dataSource = self
////        seedData()
//        fetchAll()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
//    func seedData(){
//        let characters = ["Batman", "Mario", "Torn", "Fireball", "Aqua"]    
//        for c in characters {
//            let item = NSEntityDescription.insertNewObject(forEntityName: "Character", into: managedObjectContext) as! Character
//            item.name = c
//            appDelegate.saveContext()
//        }
//        fetchAll()
//    }
//    
//    func fetchAll(){
//        let request = NSFetchRequest<NSFetchRequestResult>( entityName: "Character" )
//        do {
//            result = try managedObjectContext.fetch( request ) as! [Character]
//        } catch {
//            print( error )
//        }
//    }
//    
//    
//}
//
//extension CustomSwipeVC: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return result.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
////        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! SwipeTableViewCell
//        
//        if let data = result[indexPath.row].name {
//            cell.textLabel?.text = data
//        }
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
//    {
//        // 1
//        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
//            // 2
//            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .actionSheet)
//            
//            let twitterAction = UIAlertAction(title: "Twitter", style: UIAlertActionStyle.default, handler: nil)
//            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
//            
//            shareMenu.addAction(twitterAction)
//            shareMenu.addAction(cancelAction)
//            
//            self.present(shareMenu, animated: true, completion: nil)
//        })
//        // 3
//        let rateAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Rate" , handler: { (action:UITableViewRowAction, indexPath:IndexPath) -> Void in
//            // 4
//            let rateMenu = UIAlertController(title: nil, message: "Rate this App", preferredStyle: .actionSheet)
//            
//            let appRateAction = UIAlertAction(title: "Rate", style: UIAlertActionStyle.default, handler: nil)
//            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
//            
//            rateMenu.addAction(appRateAction)
//            rateMenu.addAction(cancelAction)
//            
//            self.present(rateMenu, animated: true, completion: nil)
//        })
//        // 5
//        return [shareAction,rateAction]
//    }
//
//    
//}

