//
//  Teams.swift
//  chatbot
//
//  Created by Swamita on 10/10/20.
//

import Foundation

struct TeamStats {
    var name: String
    var matches: Int
    var win: Int
    var loss: Int
    var winPercent: Float
}

struct Teams {
    let stats = [
        TeamStats(name: "Mumbai Indians", matches: 193, win: 111, loss: 79, winPercent: 57.51),
        TeamStats(name: "Chennai Super Kings", matches: 171, win: 102, loss: 67, winPercent: 59.65),
        TeamStats(name: "Kolkata Knight Riders", matches: 186, win: 95, loss: 85, winPercent: 51.08),
        TeamStats(name: "Royal Challengers Bangalore", matches: 187, win: 85, loss: 94, winPercent: 45.45),
        TeamStats(name: "Kings XI Punjab", matches: 182, win: 81, loss: 98, winPercent: 44.51),
        TeamStats(name: "Delhi Capitals", matches: 184, win: 80, loss: 98, winPercent: 43.48),
        TeamStats(name: "Rajasthan Royals", matches: 155, win: 75, loss: 73, winPercent: 48.39),
        TeamStats(name: "Sunrisers Hyderabad", matches: 114, win: 60, loss: 52, winPercent: 52.63),
        TeamStats(name: "Deccan Chargers", matches: 76, win: 29, loss: 46, winPercent: 38.16),
        TeamStats(name: "Deccan Daredevils", matches: 69, win: 25, loss: 36, winPercent: 40.00),
        TeamStats(name: "Rising Pune Supergiant", matches: 30, win: 15, loss: 15, winPercent: 50.00),
        TeamStats(name: "Gujarat Lions", matches: 30, win: 13, loss: 16, winPercent: 43.33),
        TeamStats(name: "Pune Warriors", matches: 46, win: 12, loss: 33, winPercent: 26.09),
        TeamStats(name: "Kochi Tuskers Kerala", matches: 14, win: 6, loss: 8, winPercent: 42.86)
    ]
    
    mutating func fetch(input: String) -> TeamStats {
        
        var request = TeamStats(name: "", matches: 0, win: 0, loss: 0, winPercent: 0)
        
        for item in stats {
            if input == item.name{
                request = item
            }
        }
        
        return request
    }
}
