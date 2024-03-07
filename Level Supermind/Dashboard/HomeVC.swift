//
//  HomeVC.swift
//  Level Supermind
//
//  Created by Navin Jaitapkar on 06/03/24.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var reminderbtn: UIButton!
    
    @IBOutlet weak var topviewbar: UIView!
    
    @IBOutlet weak var profileimage: UIView!
    
    @IBOutlet weak var pointsVw: UIView!
    
    @IBOutlet weak var innerpointsVw: UIView!
    
    @IBOutlet weak var tableVw: UITableView!
    
    @IBOutlet weak var insideview: UIView!
    
    var premiummem = ["Your Level remium is about to expire, renew now !"]
    
    var activitytitle = ["Gratitude","For Inner Peace"]
    var genre = ["Journal","Music"]
    var xps1 = ["10","15"]
    var time = ["1 min","10 mins"]
    var thirdcellimages = ["ladder","musical"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVw.separatorColor = .white

       // topviewbar.layer.cornerRadius = 16
        profileimage.layer.cornerRadius = 12
      //  profileimage.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        profileimage.layer.borderColor = UIColor(red: 0.157, green: 0.557, blue: 0.808, alpha: 1).cgColor
        profileimage.layer.borderWidth = 3
        
        
        pointsVw.layer.cornerRadius = 12
        pointsVw.layer.borderColor = UIColor(red: 0.157, green: 0.557, blue: 0.808, alpha: 1).cgColor
        pointsVw.layer.borderWidth = 3

        innerpointsVw.layer.cornerRadius = 12
        innerpointsVw.layer.borderColor = UIColor(red: 0.157, green: 0.557, blue: 0.808, alpha: 1).cgColor
        innerpointsVw.layer.borderWidth = 2
        insideview.layer.cornerRadius = 12
        tableVw.separatorColor = .clear
    }
    
    @IBAction func reminderbtnPressed(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddReminder") as! AddReminder
        
        navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension HomeVC: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else if section == 1{
            return 1
        }else{
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! FirstCellCTVC
            cell1.selectionStyle = .none
            
            cell1.firstVw.layer.cornerRadius = 12
            cell1.firstVw.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
            cell1.firstVw.layer.shadowRadius = 2
            
            cell1.firstlbl.text = premiummem[indexPath.row]
            
            return cell1
            
            
        }else if indexPath.section == 1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! SecondCellCTVC
            cell.selectionStyle = .none
            
            cell.layer.cornerRadius = 12
            
            return cell
            
            
        }else if indexPath.section == 2{
            
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! ThirdCellCTVC
            cell3.selectionStyle = .none
            
            if indexPath.row == 0{
               // cell3.backgroundColor = UIColor(red: 0.157, green: 0.557, blue: 0.808, alpha: 1)
                cell3.thirdVw.layer.cornerRadius = 12
                cell3.thirdVw.backgroundColor = UIColor(red: 0.157, green: 0.557, blue: 0.808, alpha: 1)
                cell3.nichelvl.textColor = .white
                cell3.sessionname.textColor = .white
                cell3.timelbl.textColor = .white
                cell3.xps.textColor = .white
            }else if indexPath.row == 1{
                cell3.thirdVw.layer.cornerRadius = 12
                cell3.thirdVw.backgroundColor = UIColor(red: 0.257, green: 0.512, blue: 0.707, alpha: 1)
            }
            cell3.layer.cornerRadius = 12
            cell3.sessionname.text = activitytitle[indexPath.row]
            cell3.nichelvl.text = genre[indexPath.row]
            cell3.xps.text = xps1[indexPath.row]
            cell3.timelbl.text = time[indexPath.row]
            cell3.imageVw.image = UIImage(named: thirdcellimages[indexPath.row])
            return cell3
            
        }
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 80
        }else if indexPath.section == 1{
            return 160
        }else if indexPath.section == 2{
            return 140
        }
        
        return 160
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 1{
            
            return "Must Do For Your Goals"
            
        }else if section == 2{
            
            return "Activity Routine"
        }else {
            
            return ""
        }
        
        
    }
    
}
