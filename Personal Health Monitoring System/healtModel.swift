//
//  healtModel.swift
//  Personal Health Monitoring System
//
//  Created by  on 4/15/21.
//  Copyright © 2021 Arizona State University. All rights reserved.
//

import Foundation
import CoreData
class healthModel{
    var manage:NSManagedObjectContext
    var arr = [Health]()
    init(manage:NSManagedObjectContext){
        self.manage = manage
    }
    
    func saveContext(day:String?, sys:Int?, dia:Int?, weigth:Int?, sugar:Int?, other:String?){
        let ent = NSEntityDescription.entity(forEntityName: "Health", in: manage)
        let health = Health(entity: ent!, insertInto: manage)
        if let x = sys{
            health.systolicBloodPressure = Int64(x)
        }
        if let x = dia{
            health.diostolicBloodPressure = Int64(x)
        }
        if let x = weigth{
            health.weight = Int64(x)
        }
        if let x = sugar{
            health.sugarLevel = Int64(x)
        }
        if let x = other{
            health.other = x
        }
        if let x = day{
            health.day = x
        }
        arr = fetch()
        do{
            try manage.save()
            print("\(day!) has saved \(other!)")
        }catch let error{
            print("there was en error when saving the health data \(error.localizedDescription)")
        }
    }
    
    func fetch()->[Health]{
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Health")
        let sort = NSSortDescriptor(key: "day", ascending: true)
        fetch.sortDescriptors = [sort]
        var result = try? self.manage.fetch(fetch) as? [Health]
        var ret = [Health]()
        if result != nil{
            ret = result!
        }
        return ret
    }
    
    func fetchCount()->Int{
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Health")
        let sort = NSSortDescriptor(key: "day", ascending: true)
        fetch.sortDescriptors = [sort]
        let result = try? self.manage.fetch(fetch)
        var count = 0
        if result != nil{
            count = result!.count
        }
        return count
    }
    
    func clearData()->Bool{
        var ret = false
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Health")
        let del = NSBatchDeleteRequest(fetchRequest: fetch)
        do{
            try manage.execute(del)
            ret = true
        }catch let error{
            print("there was an error when trying to delete the data \(error.localizedDescription)")
        }
        return ret
    }
}
