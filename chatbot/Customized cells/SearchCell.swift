//
//  SearchCell.swift
//  chatbot
//
//  Created by Swamita on 10/10/20.
//

import UIKit

class SearchCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var playerTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        playerTextField.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        data.player = textField.text ?? ""
        textField.resignFirstResponder()
        return true
        }
    
    
    
}
