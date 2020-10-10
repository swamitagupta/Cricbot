//
//  StatsCell.swift
//  chatbot
//
//  Created by Swamita on 10/10/20.
//

import UIKit

class StatsCell: UITableViewCell {
    
    var stats = Teams()
    

    @IBOutlet weak var teamNane: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    
    @IBOutlet weak var matchesValue: UILabel!
    @IBOutlet weak var winValue: UILabel!
    @IBOutlet weak var lossValue: UILabel!
    @IBOutlet weak var winPercent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
