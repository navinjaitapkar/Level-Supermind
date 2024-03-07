//
//  AddReminder.swift
//  Level Supermind
//
//  Created by Apple on 07/03/24.
//

import UIKit
import CoreData

class AddReminder: UIViewController {

    @IBOutlet weak var tableVw: UITableView!
    @IBOutlet weak var addreminderbtn: UIButton!
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    
    var data = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVw.separatorColor = .white
        
        getCoreData()

    }
    
    func getCoreData() {
        
        data = [String]()
        
        let ctx = appDel.persistentContainer.viewContext
        
        let fetchRequest1: NSFetchRequest<ReminderTable> = ReminderTable.fetchRequest()

        do {
            let notificationId = try ctx.fetch(fetchRequest1)

            for i in notificationId {
                if let dateTime = i.dateTimeee as? String {
                    data.append(dateTime)
                }
            }
            
            tableVw.reloadData()
            
        } catch {
            print("Error Fetching Data \(error)")
        }
        
    }

    @IBAction func addreminderbtnPressed(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SavingReminderVC") as! SavingReminderVC
        
        vc.dismissHandler = {
            self.getCoreData()
        }
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    

}


extension AddReminder: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! AddReminderCTVC
        cell.selectionStyle = .none
        
        cell.contentVw.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        cell.contentVw.layer.shadowOpacity = 1
        cell.contentVw.layer.shadowRadius = 8
        cell.contentVw.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.contentVw.layer.cornerRadius = 14
        
        if let datetimeee = data[indexPath.row] as? String {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
            if let date = dateFormatter.date(from: datetimeee) {
                let calendar = Calendar.current
                let components = calendar.dateComponents([.hour, .minute, .second], from: date)
                
                if let hour = components.hour, let minute = components.minute, let second = components.second {
                    let timeString = String(format: "%02d:%02d:%02d", hour, minute, second)
                    print(timeString)
                    
                    let inputFormatter = DateFormatter()
                    inputFormatter.dateFormat = "HH:mm:ss"

                    if let date = inputFormatter.date(from: timeString) {
                        let outputFormatter = DateFormatter()
                        outputFormatter.dateFormat = "hh:mm:ss a"
                        let timeString = outputFormatter.string(from: date)
                        print(timeString) // Output: 07:09:09 PM
                        cell.timelbl.text = timeString
                    } else {
                        print("Invalid time format")
                    }

                    
                    
                    
                    
                }
            } else {
                print("Invalid date format")
            }
            
            
            
        }
        
        return cell
    }
}
