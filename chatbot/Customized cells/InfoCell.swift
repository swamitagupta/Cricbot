//
//  InfoCell.swift
//  chatbot
//
//  Created by Swamita on 11/10/20.
//

import UIKit
import SafariServices

class InfoCell: UITableViewCell {

    @IBOutlet weak var urlButton: UIButton!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let url = URL(string: (sender as AnyObject).currentTitle!!)
        UIApplication.shared.open(url!)
        
        
    }
    
}
