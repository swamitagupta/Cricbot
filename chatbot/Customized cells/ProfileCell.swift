//
//  ProfileCell.swift
//  chatbot
//
//  Created by Swamita on 10/10/20.
//

import UIKit

class ProfileCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var dob: UILabel!
    @IBOutlet weak var birthPlace: UILabel!
    @IBOutlet weak var team: UILabel!
    @IBOutlet weak var battingStyle: UILabel!
    @IBOutlet weak var bowlingStyle: UILabel!
    @IBOutlet weak var teamList: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
