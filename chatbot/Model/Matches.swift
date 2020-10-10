//
//  Matches.swift
//  chatbot
//
//  Created by Swamita on 10/10/20.
//

import Foundation

struct MatchModel {
    let teamA: String
    let teamB: String
    let date: String
    let place: String
    let scoreA: String
    let scoreB: String
}

struct PlayerModel {
    let name: String
    let age: Int
    let dob: String
    let birthPlace: String
    let country: String
    let bat: String
    let bowl: String
    let teams: String
}

struct Prediction {
    let teamA: String
    let teamB: String
    let date: String
    let place: String
    let scoreA: String
    let scoreB: String
    let prediction: String
}
