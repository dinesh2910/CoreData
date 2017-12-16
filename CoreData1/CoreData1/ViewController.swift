//
//  ViewController.swift
//  CoreData1
//
//  Created by dinesh danda on 2/4/17.
//  Copyright © 2017 dinesh danda. All rights reserved.
//

import UIKit
import Foundation
import CoreData


class ViewController: UIViewController {

    @IBOutlet weak var nametxtfield: UITextField!
    @IBOutlet weak var displylabel: UILabel!
    
    var managedObjectContext: NSManagedObjectContext!
    var listOfpeople = [NSManagedObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // This gives the access to core data and give persistance and save once after the terminationo of simulater// it is mandatory...
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        managedObjectContext = appdelegate.persistentContainer.viewContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addbtn(_ sender: UIButton) {
        // 4 steps 1)declare entity 2) declare attributes 3) save it 4)print to console//
        
        // declare entity into managedobjectcontext//
        let newperson = NSEntityDescription.insertNewObject(forEntityName: "Person", into: managedObjectContext)
        
        // declare attribute to textfield where it should be entered/
        
        newperson.setValue(nametxtfield!, forKey: "name")
        
        // save the context to coredata//
        
        do{
            try self.managedObjectContext.save()
        }catch {
            print("Error was occured")
        
        }
        print(newperson)
    }
    
    func deletebtn(_ sender: UIButton) {
    }
    
    func fetchperson(){
        let fetchrequest:NSFetchRequest <NSFetchRequestResult> = NSFetchRequest(entityName: "Person")
        do {
            let result = try managedObjectContext.fetch(fetchrequest)
            listOfpeople = result as! [NSManagedObject]
            print(listOfpeople)
            for Person in listOfpeople{
                displylabel.text! += Person.value(forKey: "name") as! String + ", "
            }
            
        }catch{
            print("Error Has been occured")
        }
            
        }
    }
    
    
    
    

