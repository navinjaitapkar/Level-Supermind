//
//  SecondCellCTVC.swift
//  Level Supermind
//
//  Created by Navin Jaitapkar on 06/03/24.
//

import UIKit

class SecondCellCTVC: UITableViewCell {

    @IBOutlet weak var secondVw: UIView!
    
    @IBOutlet weak var collectionVw: UICollectionView!
    
    var title1 = ["Day 2: Steps To Recharge","Training Day"]
    
    var type = ["Meditation","Workout"]
    var coach = ["Muskaan","Navin"]
    var time = ["10 mins","60 mins"]
    var xps = ["10XP","20XP"]
    
    var imagesofcoll = ["girl","workout"]
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionVw.dataSource = self
        collectionVw.delegate = self
         

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension SecondCellCTVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell4", for: indexPath) as! CustomCVC
        
        cell.layer.cornerRadius = 12
        if indexPath.row == 0{
            
            cell.backgroundColor = UIColor.lightGray
            
        }else if indexPath.row == 1{
            
            cell.backgroundColor = UIColor.green
        }
        
        cell.imagVw.image = UIImage(named: imagesofcoll[indexPath.row])
        cell.titlelbl.text = title1[indexPath.row]
        cell.coachnamelbl.text = "Coach - \(coach[indexPath.row])"
        cell.meditationlbl.text = type[indexPath.row]
        cell.timelbl.text = time[indexPath.row]
        cell.xps.text = xps[indexPath.row]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 10)/1.1 , height: collectionView.frame.height)

    }
    
}
