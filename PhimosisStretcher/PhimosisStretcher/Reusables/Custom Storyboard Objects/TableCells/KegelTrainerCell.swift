//
//  KegelTimerCell.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 16/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class KegelTrainerCell: UITableViewCell {
    
    @IBOutlet weak var kegelTrainerLogo: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSubTitle: UILabel!
    @IBOutlet weak var cellDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if(selected) {
            if let url = URL(string: "itms-apps://apps.apple.com/us/app/kegel-trainer/id1451350209") {
                UIApplication.shared.open(url)
            }
        }
    }
    
}
