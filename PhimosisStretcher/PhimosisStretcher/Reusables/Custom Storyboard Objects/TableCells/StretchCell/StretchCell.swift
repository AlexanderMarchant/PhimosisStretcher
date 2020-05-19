//
//  StretchCell.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 19/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

class StretchCell: UITableViewCell {
    
    @IBOutlet var stretchImage: UIImageView!
    @IBOutlet var stretchTitle: UILabel!
    @IBOutlet var previewText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
