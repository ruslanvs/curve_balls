//
//  CustomSwipesTVC.swift
//  curve_balls
//
//  Created by Ruslan Suvorov on 3/24/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit
import CoreData

class CustomSwipesTVC: UITableViewController {
    
    let name = ["Batman", "Mario", "Torn", "Fireball", "Aqua"]
    let nemesis = ["Batman nemesis", "Mario nemesis", "Torn nemesis", "Fireball nemesis", "Aqua nemesis"]
    let world = ["Batman world", "Mario world", "Torn world", "Fireball world", "Aqua world"]
    var pointer = ["", "", "", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 45
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "customSwipesCellBasic", for: indexPath)
        
        if pointer[indexPath.row] == "nemesis" {
            cell = tableView.dequeueReusableCell(withIdentifier: "customSwipesCellSubtitle", for: indexPath)
            
            cell.detailTextLabel?.text = nemesis[indexPath.row]
        } else if pointer[indexPath.row] == "world" {
            cell = tableView.dequeueReusableCell(withIdentifier: "customSwipesCellSubtitle", for: indexPath)
            cell.detailTextLabel?.text = world[indexPath.row]
        }
        
        cell.textLabel?.text = name[indexPath.row]
        
        return cell
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let nemesis = UITableViewRowAction(style: .destructive, title: "Nemesis") { (action, indexPath) in
            print( "Nemesis" )
            self.pointer[indexPath.row] = "nemesis"
            tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.right) //>> Eli: how appropriate is this solution?
        }
        
        let world = UITableViewRowAction(style: .destructive, title: "World") { (action, indexPath) in
            print( "World" )
            self.pointer[indexPath.row] = "world"
            tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.right)
        }
        
        let clear = UITableViewRowAction(style: .normal, title: "Clear") { (action, indexPath) in
            print( "Clear" )
            self.pointer[indexPath.row] = ""
            tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.right)
        }

//        clear.backgroundColor = UIColor.blue
        
        let arrNemesis = [clear, nemesis]
        let arrWorld = [clear, world]
        
        var arr = [world, nemesis]
        
        if pointer[indexPath.row] == "nemesis" {
            arr = arrWorld
        } else if pointer[indexPath.row] == "world" {
            arr = arrNemesis
        }
        
        return arr
    }
}










