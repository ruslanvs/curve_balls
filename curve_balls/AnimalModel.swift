//
//  AnimalModel.swift
//  curve_balls
//
//  Created by Ruslan Suvorov on 3/25/18.
//  Copyright © 2018 Ruslan Suvorov. All rights reserved.
//

import UIKit
import CoreData

class AnimalModel {
    private var managedObjectContext = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    private var appDelegate = ( UIApplication.shared.delegate as! AppDelegate )
    
    static let shared = AnimalModel()
    
    func get( whereAnimalTypeIs animalType: String? = nil ) -> [Animal] {
        
        let request = NSFetchRequest<NSFetchRequestResult>( entityName: "Animal" )
        
        if let a = animalType {
            request.predicate = NSPredicate( format: "type = %@", a as CVarArg )
        }
        
        do {
            return try managedObjectContext.fetch( request ) as! [Animal]
        } catch {
            print( error )
            return []
        }
    }
    
    func create(itemName name: String, itemType type: String) -> Animal {
        print("create")
        let item = NSEntityDescription.insertNewObject( forEntityName: "Animal", into: managedObjectContext ) as! Animal
        item.name = name
        item.type = type
        saveContext()
        return item
    }
    
    func delete(_ item: Animal) {
        managedObjectContext.delete(item)
        saveContext()
    }
    
    func saveContext() {
        appDelegate.saveContext()
    }
}
