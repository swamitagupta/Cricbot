//
//  RoundedButton.swift
//  chatbot
//
//  Created by Swamita on 09/10/20.
//

import UIKit

//@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable var borderColor: UIColor? = UIColor.systemIndigo
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = 15
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = borderColor?.cgColor
        
    }
}
