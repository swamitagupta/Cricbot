//
//  MatchCell.swift
//  chatbot
//
//  Created by Swamita on 10/10/20.
//

import UIKit

class MatchCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var winnerLogo: UIImageView!
    @IBOutlet weak var winnerName: UILabel!
    @IBOutlet weak var winnerScore: UILabel!
    @IBOutlet weak var loserLogo: UIImageView!
    @IBOutlet weak var loserName: UILabel!
    @IBOutlet weak var loserScore: UILabel!
    @IBOutlet weak var remark: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
