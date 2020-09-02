//
//  EliminationTableViewCell.swift
//  standaloneScoring
//
//  Created by Apple on 23/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit

class EliminationTableViewCell: UITableViewCell {

    @IBOutlet weak var lblRound: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
