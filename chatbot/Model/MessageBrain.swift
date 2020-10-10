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
        
        Request(userMessage: "Search matches", botMessage: "Your matches are", options: ["Filter matches", "Quit"], type: "list", identifier: "match"),
        
        Request(userMessage: "Filter matches", botMessage: "Select filters", options: ["Done", "Quit"], type: "select", identifier: "filter"),
        
        Request(userMessage: "Done", botMessage: "Your matches are", options: ["Filter matches", "Quit"], type: "match", identifier: "match"),
        
        //TEAMS
        Request(userMessage: "Teams", botMessage: "Select your team", options: ["Search team", "Quit"], type: "select", identifier: "team"),
        
        Request(userMessage: "Search team", botMessage: "Your team stats are", options: ["More info", "Quit"], type: "stats", identifier: "id"),
        
        Request(userMessage: "More info", botMessage: "Explore your team", options: ["Search team", "Quit"], type: "select", identifier: "team"),
        
        
        //PLAYERS
        Request(userMessage: "Players", botMessage: "Search player", options: ["Find player", "Quit"], type: "search", identifier: "player"),
        
        Request(userMessage: "Find player", botMessage: "Your player is", options: ["About","Quit"], type: "show", identifier: "profile"),
        
        Request(userMessage: "About", botMessage: "Sachin Tendulkar has been the most complete batsman of his time, the most prolific runmaker of all time, and arguably the biggest cricket icon the game has ever known. His batting was based on the purest principles: perfect balance, economy of movement, precision in stroke-making, and that intangible quality given only to geniuses - anticipation. If he didn't have a signature stroke - the upright, back-foot punch comes close - it's because he was equally proficient at each of the full range of orthodox shots (and plenty of improvised ones as well) and can pull them out at will.", options: ["Go back","Quit"], type: "", identifier: "profile"),
        
        Request(userMessage: "Go back", botMessage: "Search player", options: ["Find player", "Quit"], type: "search", identifier: "player"),
        
        //SCHEDULE
        Request(userMessage: "Schedule", botMessage: "Select your option", options: ["Live scores", "Upcoming"], type: "", identifier: "id"),
        
        Request(userMessage: "Live scores", botMessage: "The live score is", options: ["Upcoming","Quit"], type: "match", identifier: "live"),
        
        Request(userMessage: "Upcoming", botMessage: "Upcoming matches are", options: ["Live scores","Quit"], type: "list", identifier: "schedule"),
        
        //PREDICT
        Request(userMessage: "Predict", botMessage: "Select your teams", options: ["Show", "Quit"], type: "select", identifier: "two teams"),
        
        Request(userMessage: "Show", botMessage: "Predictions are", options: ["Predict", "Quit"], type: "match", identifier: "predict")
        
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
