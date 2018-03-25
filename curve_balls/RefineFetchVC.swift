//
//  RefineFetchVC.swift
//  curve_balls
//
//  Created by Ruslan Suvorov on 3/25/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit

class RefineFetchVC: UIViewController {
    
    var animalsArr = [Animal]()
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        animalsArr = AnimalModel.shared.get( whereAnimalTypeIs: nil )
        tableView.dataSource = self
        tableView.delegate = self
//        seedData()
    }
    
    func seedData(){
        let name = ["cheetah", "lion", "crocodile"]
        let type = ["mammal", "mammal", "reptile"]
        for i in 0..<name.count {
            AnimalModel.shared.create(itemName: name[i], itemType: type[i])
        }
        animalsArr = AnimalModel.shared.get( whereAnimalTypeIs: nil )
        tableView.reloadData()
    }

    
    @IBAction func filteringButtonPressed(_ sender: UIButton) {
        print (sender.titleLabel?.text)
        if sender.titleLabel!.text == "Show only reptiles" {
            animalsArr = AnimalModel.shared.get(whereAnimalTypeIs: "reptile")
        } else if sender.titleLabel!.text == "Show only mammals" {
            animalsArr = AnimalModel.shared.get(whereAnimalTypeIs: "mammal")
        } else {
            animalsArr = AnimalModel.shared.get( whereAnimalTypeIs: nil )
        }
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


extension RefineFetchVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = animalsArr[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        AnimalModel.shared.delete( animalsArr[indexPath.row] )
        animalsArr.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
    }
    
    
}



