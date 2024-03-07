//
//  FirstCellCTVC.swift
//  Level Supermind
//
//  Created by Navin Jaitapkar on 06/03/24.
//

import UIKit

class FirstCellCTVC: UITableViewCell {

    @IBOutlet weak var firstVw: UIView!
    
    @IBOutlet weak var firstlbl: UILabel!
    
    @IBOutlet weak var firstbtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()

        firstbtn.layer.cornerRadius = 10
        firstbtn.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        firstbtn.layer.borderWidth = 2

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
