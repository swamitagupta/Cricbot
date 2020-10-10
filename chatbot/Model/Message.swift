//
//  Message.swift
//  chatbot
//
//  Created by Swamita on 09/10/20.
//

import Foundation

struct Message {
    let message: String
    let bot: Bool
}

struct Request {
    let userMessage: String
    let botMessage: String
    let options: [String]
    let identifier: String
}
