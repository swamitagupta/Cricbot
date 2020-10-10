//
//  MessageBrain.swift
//  chatbot
//
//  Created by Swamita on 10/10/20.
//

import Foundation

struct MessageBrain {
    
    let stack = [
        
        // MATCHES
        Request(userMessage: "Matches", botMessage: "Select your teams", options: ["Search matches", "Quit"], identifier: "id"),
        
        Request(userMessage: "Search matches", botMessage: "Your matches are", options: ["Filter matches", "Quit"], identifier: "id"),
        
        Request(userMessage: "Filter matches", botMessage: "Select filters", options: ["Done", "Quit"], identifier: "id"),
        
        Request(userMessage: "Done", botMessage: "Your matches are", options: ["Filter matches", "Quit"], identifier: "id"),
        
        //TEAMS
        Request(userMessage: "Teams", botMessage: "Select your team", options: ["Search team", "Quit"], identifier: "id"),
        
        Request(userMessage: "Search team", botMessage: "Your team stats are", options: ["vs team", "Quit"], identifier: "id"),
        
        Request(userMessage: "vs team", botMessage: "Select another team", options: ["Compare", "Quit"], identifier: "id"),
        
        Request(userMessage: "Compare", botMessage: "Team comparision...", options: ["vs team", "Quit"], identifier: "id"),
        
        //PLAYERS
        Request(userMessage: "Players", botMessage: "Select player", options: ["Find player", "Quit"], identifier: "id"),
        
        Request(userMessage: "Find player", botMessage: "Your player is", options: ["Search player","Quit"], identifier: "id"),
        
        Request(userMessage: "Search player", botMessage: "Select player", options: ["Find player", "Quit"], identifier: "id"),
        
        //SCHEDULE
        Request(userMessage: "Schedule", botMessage: "Select your option", options: ["Live scores", "Upcoming"], identifier: "id"),
        
        Request(userMessage: "Live scores", botMessage: "The live score is", options: ["Upcoming","Quit"], identifier: "id"),
        
        Request(userMessage: "Upcoming", botMessage: "Upcoming matches are", options: ["Live scores","Quit"], identifier: "id"),
        
        //PREDICT
        Request(userMessage: "Predict", botMessage: "Select your teams", options: ["Show", "Quit"], identifier: "id"),
        
        Request(userMessage: "Show", botMessage: "Predictions are", options: ["Filter predictions", "Quit"], identifier: "id"),
        
        Request(userMessage: "Filter predictions", botMessage: "Choose filters", options: ["Apply filters", "Quit"], identifier: "id"),
        
        Request(userMessage: "Apply filters", botMessage: "Predictions are", options: ["Filter predictions", "Quit"], identifier: "id")
        
    ]
    
    mutating func follow(input: String) -> Request {
        
        var request = Request(userMessage: input, botMessage: "Faced unexpected error.", options: ["Quit"], identifier: "id")
        
        for item in stack {
            if input == item.userMessage {
                request = item
            }
        }
        
        return request
    }
}
