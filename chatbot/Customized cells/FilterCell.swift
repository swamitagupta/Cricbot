//
//  FilterCell.swift
//  chatbot
//
//  Created by Swamita on 10/10/20.
//

import UIKit

class FilterCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var yearTextField: UITextField!
    
    var pickerData: [String] = [String]()
    var object: String = String()
    let myPicker = UIPickerView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("\(object) bahagaha")
        if object == "player" {
            yearTextField.inputView = nil
        } else {
            yearTextField.inputView = myPicker
        }
        myPicker.delegate = self
        yearTextField.text = ""
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        yearTextField.text = pickerData[row]
        if object == "team A"{
            data.teamA = pickerData[row]
        } else if object == "team B" {
            data.teamB = pickerData[row]
        } else if object == "player" {
            data.player = pickerData[row]
        } else if object == "year" {
            data.year = pickerData[row]
        } else if object == "city" {
            data.city = pickerData[row]
        }
        
        yearTextField.resignFirstResponder()
    }
    
}
