//
//  Message.swift
//  chatbot
//
//  Created by Swamita on 09/10/20.
//

import Foundation

struct Message {
    let message: String
    let type: String
}

struct Request {
    let userMessage: String
    let botMessage: String
    let options: [String]
    let type: String
    let identifier: String
}
