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
        Request(userMessage: "Matches", botMessage: "Select your teams", options: ["Search matches", "Quit"], type: "select", identifier: "two teams"),
        
        Request(userMessage: "Search matches", botMessage: "Your matches are", options: ["Filter matches", "Quit"], type: "", identifier: "id"),
        
        Request(userMessage: "Filter matches", botMessage: "Select filters", options: ["Done", "Quit"], type: "select", identifier: "filter"),
        
        Request(userMessage: "Done", botMessage: "Your matches are", options: ["Filter matches", "Quit"], type: "", identifier: "id"),
        
        //TEAMS
        Request(userMessage: "Teams", botMessage: "Select your team", options: ["Search team", "Quit"], type: "select", identifier: "team"),
        
        Request(userMessage: "Search team", botMessage: "Your team stats are", options: ["vs team", "Quit"], type: "", identifier: "id"),
        
        Request(userMessage: "vs team", botMessage: "Select another team", options: ["Compare", "Quit"], type: "select", identifier: "team"),
        
        Request(userMessage: "Compare", botMessage: "Team comparision...", options: ["vs team", "Quit"], type: "", identifier: "id"),
        
        //PLAYERS
        Request(userMessage: "Players", botMessage: "Search player", options: ["Find player", "Quit"], type: "search", identifier: "player"),
        
        Request(userMessage: "Find player", botMessage: "Your player is", options: ["Search player","Quit"], type: "show", identifier: "profile"),
        
        Request(userMessage: "Search player", botMessage: "Search player", options: ["Find player", "Quit"], type: "search", identifier: "player"),
        
        //SCHEDULE
        Request(userMessage: "Schedule", botMessage: "Select your option", options: ["Live scores", "Upcoming"], type: "", identifier: "id"),
        
        Request(userMessage: "Live scores", botMessage: "The live score is", options: ["Upcoming","Quit"], type: "", identifier: "id"),
        
        Request(userMessage: "Upcoming", botMessage: "Upcoming matches are", options: ["Live scores","Quit"], type: "", identifier: "id"),
        
        //PREDICT
        Request(userMessage: "Predict", botMessage: "Select your teams", options: ["Show", "Quit"], type: "select", identifier: "two teams"),
        
        Request(userMessage: "Show", botMessage: "Predictions are", options: ["Filter predictions", "Quit"], type: "", identifier: "id"),
        
        Request(userMessage: "Filter predictions", botMessage: "Choose filters", options: ["Apply filters", "Quit"], type: "select", identifier: "filter"),
        
        Request(userMessage: "Apply filters", botMessage: "Predictions are", options: ["Filter predictions", "Quit"], type: "", identifier: "id"),
        
        
    ]
    
    mutating func follow(input: String) -> Request {
        
        var request = Request(userMessage: input, botMessage: "Faced unexpected error.", options: ["Quit"], type: "", identifier: "id")
        
        for item in stack {
            if input == item.userMessage {
                request = item
            }
        }
        
        return request
    }
}
