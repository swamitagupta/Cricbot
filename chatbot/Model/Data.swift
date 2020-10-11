//
//  Data.swift
//  chatbot
//
//  Created by Swamita on 10/10/20.
//

import Foundation

struct Data {
    var teamA: String
    var teamB: String
    var player: String
    var year: String
    var city: String
    
    var scoreA: String
    var scoreB: String
    var prediction: String
    var winner: String
    
    var team2A: String
    var team2B: String
    var year2: String
    var city2: String
    var score2A: String
    var score2B: String
    var winner2: String
    
    var team3A: String
    var team3B: String
    var year3: String
    var city3: String
    var score3A: String
    var score3B: String
    var winner3: String
}

/*
 [OrderedDict([('id', '12'), ('season', '2017'), ('city', 'Bangalore'), ('date', '2017-04-14'), ('team1', 'Royal Challengers Bangalore'), ('team2', 'Mumbai Indians'), ('toss_winner', 'Mumbai Indians'), ('toss_decision', 'field'), ('result', 'normal'), ('dl_applied', '0'), ('winner', 'Mumbai Indians'), ('win_by_runs', '0'), ('win_by_wickets', '4'), ('player_of_match', 'KA Pollard'), ('venue', 'M Chinnaswamy Stadium'), ('umpire1', 'KN Ananthapadmanabhan'), ('umpire2', 'AK Chaudhary'), ('umpire3', '')]), OrderedDict([('id', '37'), ('season', '2017'), ('city', 'Mumbai'), ('date', '2017-05-01'), ('team1', 'Royal Challengers Bangalore'), ('team2', 'Mumbai Indians'), ('toss_winner', 'Royal Challengers Bangalore'), ('toss_decision', 'bat'), ('result', 'normal'), ('dl_applied', '0'), ('winner', 'Mumbai Indians'), ('win_by_runs', '0'), ('win_by_wickets', '5'), ('player_of_match', 'RG Sharma'), ('venue', 'Wankhede Stadium'), ('umpire1', 'AK Chaudhary'), ('umpire2', 'CB Gaffaney'), ('umpire3', '')])]
 */

var data = Data(teamA: "Royal Challengers Bangalore", teamB: "Mumbai Indians", player: "", year: "'2017-04-14'", city: "Bangalore", scoreA: "", scoreB: "", prediction: "0.572",
                winner: "Mumbai Indian", team2A: "Royal Challengers Bangalore", team2B: "Mumbai Indians", year2: "2017-05-01", city2: "Mumbai", score2A: "", score2B: "", winner2: "Mumbai Indians",
                team3A: "Royal Challengers Bangalore", team3B: "Mumbai Indians", year3: "2020-09-28", city3: "", score3A: "", score3B: "", winner3: "Royal Challengers Bangalore")

let teams = [ "Mumbai Indians",
    "Pune Warriors",
    "Sunrisers Hyderabad",
    "Rajasthan Royals",
    "Royal Challengers Bangalore",
    "Gujarat Lions",
    "Rising Pune Supergiant",
    "Kochi Tuskers Kerala",
    "Delhi Capitals",
    "Kings XI Punjab",
    "Deccan Chargers",
    "Delhi Daredevils",
    "Chennai Super Kings",
]

let players = ["Sachin Tendulkar"]

let years = ["",
    "2008",
    "2009",
    "2010",
    "2011",
    "2012",
    "2013",
    "2014",
    "2015",
    "2016",
    "2017",
    "2018",
    "2019"
]

let cities = ["","Abu Dhabi",
              "Ahmedabad",
              "Bangalore" ,
              "Bengaluru",
              "Bloemfontein",
              "Cape Town",
              "Centurion",
              "Chandigarh",
              "Chennai",
              "Cuttack",
              "Delhi",
              "Dharamsala",
              "Durban",
              "East London",
              "Hyderabad",
              "Indore" ,
              "Jaipur",
              "Johannesburg",
              "Kanpur",
              "Kimberley",
              "Kochi",
              "Kolkata",
              "Mohali",
              "Mumbai" ,
              "Nagpur",
              "Port Elizabeth",
              "Pune",
              "Raipur",
              "Rajkot",
              "Ranchi",
              "Sharjah",
              "Visakhapatnam"
]

