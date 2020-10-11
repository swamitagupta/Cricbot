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

struct URls {
    var name: String
    var globe: String
    var twitter: String
    var youtube: String
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
    
    let links = [
        URls(name: "Sunrisers Hyderabad", globe: "https://www.sunrisershyderabad.in/", twitter: "https://twitter.com/SunRisers", youtube: "https://www.instagram.com/sunrisershyd/?hl=en"),
        URls(name: "Mumbai Indians", globe: "https://www.mumbaiindians.com/", twitter: "https://twitter.com/mipaltan", youtube: "https://www.instagram.com/mumbaiindians/?hl=en"),
        URls(name: "Gujarat Lions", globe: "https://en.wikipedia.org/wiki/Gujarat_Lions", twitter: "https://twitter.com/thegujratlions", youtube: "https://www.instagram.com/thegujratlions/?hl=en"),
        URls(name: "Rising Pune Supergiant", globe: "https://en.wikipedia.org/wiki/Rising_Pune_Supergiant", twitter: "https://twitter.com/rpsupergiants", youtube: "https://www.instagram.com/punesupergiants/?hl=en"),
        URls(name: "Royal Challengers Bangalore", globe: "https://www.royalchallengers.com", twitter: "https://twitter.com/RCBTweets", youtube: "https://www.instagram.com/royalchallengersbangalore/?hl=en"),
        URls(name: "Kolkata Knight Riders", globe: "https://www.kkr.in/", twitter: "https://twitter.com/KKRiders", youtube: "https://www.instagram.com/kkriders/?hl=en"),
        URls(name: "Delhi Daredevils", globe: "https://www.delhicapitals.in/", twitter: "https://twitter.com/DelhiCapitals", youtube: "https://www.instagram.com/delhicapitals/?hl=en"),
        URls(name: "Kings XI Punjab", globe: "https://www.kxip.in/", twitter: "https://twitter.com/lionsdenkxip", youtube: "https://www.instagram.com/kxipofficial/?hl=en"),
        URls(name: "Chennai Super Kings", globe: "https://www.chennaisuperkings.com/", twitter: "https://twitter.com/ChennaiIPL", youtube: "https://www.instagram.com/chennaiipl/?hl=en"),
        URls(name: "Rajasthan Royals", globe: "https://www.rajasthanroyals.com/", twitter: "https://twitter.com/rajasthanroyals", youtube: "https://www.instagram.com/rajasthanroyals/?hl=en"),
        URls(name: "Deccan Chargers", globe: "https://en.wikipedia.org/wiki/List_of_Deccan_Chargers_cricketers", twitter: "https://twitter.com/chargershome", youtube: "https://www.instagram.com/deccanchronicle_official/?hl=en"),
        URls(name: "Kochi Tuskers Kerala", globe: "https://en.wikipedia.org/wiki/Kochi_Tuskers_Kerala", twitter: "https://twitter.com/kochituskersktk", youtube: "https://www.instagram.com/kochituskerstuskers/?hl=en"),
        URls(name: "Pune Warriors", globe: "https://en.wikipedia.org/wiki/Pune_Warriors_India", twitter: "https://twitter.com/punewarriorsipl", youtube: "https://www.instagram.com/explore/tags/punewarriors/?hl=en"),
        URls(name: "Delhi Capitals", globe: "https://www.delhicapitals.in/", twitter: "https://twitter.com/DelhiCapitals", youtube: "https://www.instagram.com/delhicapitals/?hl=en")
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
    
    mutating func links(input: String) -> String {
        var url = URls(name: "", globe: "", twitter: "", youtube: "")
        for item in links {
            if data.teamA == item.name{
                url = item
            }
        }
        if input == "globe" {
            return url.globe
        } else if input == "twitter" {
            return url.twitter
        } else {
            return url.youtube
        }
    }
    
    mutating func short(input: String) -> String {
        var array = input.components(separatedBy: " ")
        var shortform = ""
        for i in 0...array.count-1{
            let item = array[i]
            shortform += item[0]
        }
        print(shortform)
        return shortform
    }
}

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
