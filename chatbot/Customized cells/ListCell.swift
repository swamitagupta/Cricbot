//
//  ListCell.swift
//  chatbot
//
//  Created by Swamita on 10/10/20.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var day1: UILabel!
    @IBOutlet weak var team1A: UILabel!
    @IBOutlet weak var team1B: UILabel!
    @IBOutlet weak var remark1: UILabel!
    
    @IBOutlet weak var day2: UILabel!
    @IBOutlet weak var team2A: UILabel!
    @IBOutlet weak var team2B: UILabel!
    @IBOutlet weak var remark2: UILabel!
    
    @IBOutlet weak var day3: UILabel!
    @IBOutlet weak var team3A: UILabel!
    @IBOutlet weak var team3B: UILabel!
    @IBOutlet weak var remark3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
