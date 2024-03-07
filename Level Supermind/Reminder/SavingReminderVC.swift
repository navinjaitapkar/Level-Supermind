//
//  SavingReminderVC.swift
//  Level Supermind
//
//  Created by Apple on 07/03/24.
//

import UIKit
import CoreData

class SavingReminderVC: UIViewController {
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBOutlet weak var savebtn: UIButton!
    
    var dismissHandler: (() -> Void)?
    var datedata = Date()
    override func viewDidLoad() {
        super.viewDidLoad()

        print("dnslnfsnnnndf \(FileManager.default.temporaryDirectory)")
        
    }
    
    
    @IBAction func savingDateValuechanged(_ sender: UIDatePicker) {
        
        datedata = sender.date
        
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        
        var finalData = String()
        
        let dateString = "\(datepicker.date)"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        
        if let date = dateFormatter.date(from: dateString) {
            let newDateFormatter = DateFormatter()
            newDateFormatter.dateFormat = "yyyy-MM-dd"
            
            let formattedDate = newDateFormatter.string(from: date)
            finalData = "\(formattedDate)"
        } else {
            print("Invalid date format")
        }
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: finalData) {
            let newDateFormatter = DateFormatter()
            newDateFormatter.dateFormat = "dd/MM/yyyy"
            
            let formattedDate = newDateFormatter.string(from: date)
            finalData = "\(formattedDate)"
        } else {
            print("Invalid date format")
        }
        
        var timeee = String()
        
        var remindrTime = datepicker.date
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var formatedReminderTime = dateFormatter.string(from: remindrTime)
        if let date = dateFormatter.date(from: "\(formatedReminderTime)") {
            // Now, format the date to display only the time part
            dateFormatter.dateFormat = "HH:mm:ss"
            let timeString = dateFormatter.string(from: date)
            timeee = "\(timeString)"
        } else {
            print("Failed to convert the string to a Date object. Visit Time")
        }
        
        
        //        print("finaldatee \(finalData)")
        //        print("timeeeeee \(timeee)")
        
        var finalDateTime = "\(finalData) \(timeee)"
        print("finalDateTime \(finalDateTime)")
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let timecoree = ReminderTable(context: context)

        timecoree.dateTimeee = "\(finalDateTime)"
        timecoree.time = datepicker.date
        
        do {
            try context.save()
            navigationController?.popViewController(animated: true)
            self.dismissHandler?()
        } catch {
            print("Error saving context: \(error)")
        }

//        let ctx = appDel.persistentContainer.viewContext
//
//
//        
//        let cases = ReminderTable(context: ctx)
//        
//        // Set the date and time value to the entity
//        // cases.setValue(datepicker.date, forKey: "dateTime")
//        
//        cases.time = "\(finalDateTime)"
//        
//        // Save the entity to CoreData
//        do {
//            try ctx.save()
//            
//            navigationController?.popViewController(animated: true)
//            print("Reminder saved successfully!")
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
        
    }
    

}
