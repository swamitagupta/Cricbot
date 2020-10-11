//
//  ViewController.swift
//  chatbot
//
//  Created by Swamita on 09/10/20.
//

import UIKit
import AWSLex

class ChatViewController: UIViewController, AWSLexInteractionDelegate {
    
    var interactionKit: AWSLexInteractionKit?
    var fetched = ""
    
    
    func interactionKit(_ interactionKit: AWSLexInteractionKit, onError error: Error) {
        print("interactionKit error: \(error)")
    }
    
    func setUpLex(){
        self.interactionKit = AWSLexInteractionKit.init(forKey: "chatConfig")
        self.interactionKit?.interactionDelegate = self
    }
    
    func sendToLex(text : String){
        self.interactionKit?.text(inTextOut: text, sessionAttributes: nil)
    }
    
    func interactionKit(_ interactionKit: AWSLexInteractionKit, switchModeInput: AWSLexSwitchModeInput, completionSource: AWSTaskCompletionSource<AWSLexSwitchModeResponse>?) {
        guard let response = switchModeInput.outputText else {
            let response = "Can't get you, please try again!"
            print("Response: \(response)")
            return
        }
        fetched = response
    }
    
    
    
    var Messages : [Message] = []
    var messageBrain = MessageBrain()
    var stats = Teams()

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var button1: RoundedButton!
    @IBOutlet weak var button2: RoundedButton!
    @IBOutlet weak var button3: RoundedButton!
    @IBOutlet weak var button4: RoundedButton!
    @IBOutlet weak var button5: RoundedButton!
    @IBOutlet weak var button6: RoundedButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLex()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "userCell")
        tableView.register(UINib(nibName: "BotCell", bundle: nil), forCellReuseIdentifier: "botCell")
        tableView.register(UINib(nibName: "FilterCell", bundle: nil), forCellReuseIdentifier: "filterCell")
        tableView.register(UINib(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: "searchCell")
        tableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "profileCell")
        tableView.register(UINib(nibName: "MatchCell", bundle: nil), forCellReuseIdentifier: "matchCell")
        tableView.register(UINib(nibName: "StatsCell", bundle: nil), forCellReuseIdentifier: "statsCell")
        tableView.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "listCell")
        tableView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "infoCell")
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

          view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    //MARK: - Func optionPressed
    
    @IBAction func optionPressed(_ sender: UIButton) {
        let input = sender.currentTitle!
        if input == "Quit" {
            Messages = []
            tableView.reloadData()
            button1.isHidden = false
            button2.isHidden = false
            button3.isHidden = false
            button4.isHidden = false
            button5.isHidden = false
            button6.isHidden = false
            button1.setTitle("Matches", for: .normal)
            button2.setTitle("Teams", for: .normal)
            button3.setTitle("Players", for: .normal)
            button4.setTitle("Schedule", for: .normal)
            button5.setTitle("Predict", for: .normal)
            button6.setTitle("Ask", for: .normal)
        } else {
            let request = messageBrain.follow(input: input)
            let userMessage = Message(message: request.userMessage, type: "user")
            let botMessage = Message(message: request.botMessage, type: "bot")
            Messages.append(userMessage)
            Messages.append(botMessage)
            tableView.reloadData()
            let prompts = request.options
            button1.setTitle( "\(prompts[0])" , for: .normal )
            button2.setTitle( "\(prompts[1])" , for: .normal )
            button3.isHidden = true
            button4.isHidden = true
            button5.isHidden = true
            button6.isHidden = true
            
            let id = request.identifier
            
            if request.type == "select" {
                if id == "team" {
                    Messages.append(Message(message: "team A", type: "select"))
                }
                else if id == "filter" {
                    Messages.append(Message(message: "year", type: "select"))
                    Messages.append(Message(message: "city", type: "select"))
                }
                
                else if id == "two teams" {
                    Messages.append(Message(message: "team A", type: "select"))
                    Messages.append(Message(message: "team B", type: "select"))
                }
                
            }
            else if request.type == "search" {
                Messages.append(Message(message: "player", type: "search"))
            }
            
            else if request.type == "show" {
                Messages.append(Message(message: "player", type: "profile"))
            }
            
            else if request.type == "stats" {
                Messages.append(Message(message: "team", type: "stats"))
            }
            
            else if request.type == "match" {
                Messages.append(Message(message: "match", type: id)) //match, live, predict
            }
            
            else if request.type == "list" {
                if id == "match" {
                    Messages.append(Message(message: "match", type: "list"))
                } else {
                    Messages.append(Message(message: "schedule", type: "list"))
                }
            }
            
            else if request.type == "info" {
                Messages.append(Message(message: "globe", type: "info"))
                Messages.append(Message(message: "twitter", type: "info"))
                Messages.append(Message(message: "youtube", type: "info"))
            }
            tableView.reloadData()
            tableView.reloadData()
            let indexPath = NSIndexPath(row: Messages.count-1, section: 0)
            tableView.scrollToRow(at: indexPath as IndexPath, at: .bottom, animated: true)
            
        }
        
    }
    
    @IBAction func askPressed(_ sender: Any) {
    }
    
    //MARK: - Data Extraction Functions
    
    func searchMatches() {
        let query = "Match results \(data.teamA) and \(data.teamB)"
        sendToLex(text: query)
        let response = fetched
        parse(text: response)
    }
    
    func searchMatchesY() {
        let query = "Match results \(data.teamA) and \(data.teamB) in year \(data.year)"
        sendToLex(text: query)
        let response = fetched
        parse(text: response)
    }
    
    func searchMatchesC() {
        let query = "Match results \(data.teamA) and \(data.teamB) in city \(data.city)"
        sendToLex(text: query)
        let response = fetched
        parse(text: response)
    }
    
    func searchMatchesYC() {
        let query = "Match results \(data.teamA) and \(data.teamB) in year \(data.year) in city \(data.city)"
        sendToLex(text: query)
        let response = fetched
        parse(text: response)
    }
    
    func predict() {
        let query = "compare \(data.teamA) and \(data.teamB)"
        sendToLex(text: query)
        let response = fetched
        print(response)
        data.prediction = response
        print(data.prediction)
    }
    
    func matches() {
        if data.year == "" {
            if data.city == "" {
                searchMatches()
            } else {
                searchMatchesC()
            }
        } else {
            if data.city == "" {
                searchMatchesY()
            } else {
                searchMatchesYC()
            }
        }
    }
    
    func parse(text: String) {
        let ext = String(text.dropFirst())
        let ex = String(ext.dropLast())
        var array = ex.components(separatedBy: "]), ")
        let count = array.count
        print(array)
        //print(count)
        
        for i in 0...count-1 {
            var sample = array[i]
            for j in 1...13 {
                sample = String(sample.dropFirst())
            }
            array[i] = sample
        }
        
        //print(array)
        
        /*if count == 1 {
            let element1 = array[0]
            //print(element1)
            let ele = String(element1.dropFirst())
            let le = String(ele.dropLast())
            var array1 = le.components(separatedBy: "), (")
            print(array1.count)
        
            data.city = extract(input: array1[2])
            data.year = extract(input: array1[3])
            data.teamA = extract(input: array1[4])
            data.teamB = extract(input: array1[5])
            data.winner = extract(input: array1[10])
            
        } else*/ if count == 2 {
            let element1 = array[0]
            var ele = String(element1.dropFirst())
            var le = String(ele.dropLast())
            var array1 = le.components(separatedBy: "), (")
            
            data.city = extract(input: array1[2])
            data.year = extract(input: array1[3])
            data.teamA = extract(input: array1[4])
            data.teamB = extract(input: array1[5])
            data.winner = extract(input: array1[10])
            
            let element2 = array[1]
            ele = String(element2.dropFirst())
            le = String(ele.dropLast())
            array1 = le.components(separatedBy: "), (")
            print(array1)
            data.city2 = extract(input: array1[2])
            data.year2 = extract(input: array1[3])
            data.team2A = extract(input: array1[4])
            data.team2B = extract(input: array1[5])
            data.winner2 = extract(input: array1[10])
            
        } else if count > 2 {
            let element1 = array[0]
            var ele = String(element1.dropFirst())
            var le = String(ele.dropLast())
            var array1 = le.components(separatedBy: "), (")
            data.city = extract(input: array1[2])
            data.year = extract(input: array1[3])
            data.teamA = extract(input: array1[4])
            data.teamB = extract(input: array1[5])
            data.winner = extract(input: array1[10])
            
            let element2 = array[1]
            ele = String(element2.dropFirst())
            le = String(ele.dropLast())
            array1 = le.components(separatedBy: "), (")
            data.city2 = extract(input: array1[2])
            data.year2 = extract(input: array1[3])
            data.team2A = extract(input: array1[4])
            data.team2B = extract(input: array1[5])
            data.winner2 = extract(input: array1[10])
            
            let element3 = array[2]
            ele = String(element2.dropFirst())
            le = String(ele.dropLast())
            array1 = le.components(separatedBy: "), (")
            data.city2 = extract(input: array1[2])
            data.year2 = extract(input: array1[3])
            data.team2A = extract(input: array1[4])
            data.team2B = extract(input: array1[5])
            data.winner2 = extract(input: array1[10])
         }
        
    }
    
    func extract(input: String) -> String {
        let nput = String(input.dropFirst())
        let npu = String(nput.dropLast())
        let arr = npu.components(separatedBy: "', '")
        return arr[1]
    }
}

/*
 [OrderedDict([('id', '12'), ('season', '2017'), ('city', 'Bangalore'), ('date', '2017-04-14'), ('team1', 'Royal Challengers Bangalore'), ('team2', 'Mumbai Indians'), ('toss_winner', 'Mumbai Indians'), ('toss_decision', 'field'), ('result', 'normal'), ('dl_applied', '0'), ('winner', 'Mumbai Indians'), ('win_by_runs', '0'), ('win_by_wickets', '4'), ('player_of_match', 'KA Pollard'), ('venue', 'M Chinnaswamy Stadium'), ('umpire1', 'KN Ananthapadmanabhan'), ('umpire2', 'AK Chaudhary'), ('umpire3', '')]), OrderedDict([('id', '37'), ('season', '2017'), ('city', 'Mumbai'), ('date', '2017-05-01'), ('team1', 'Royal Challengers Bangalore'), ('team2', 'Mumbai Indians'), ('toss_winner', 'Royal Challengers Bangalore'), ('toss_decision', 'bat'), ('result', 'normal'), ('dl_applied', '0'), ('winner', 'Mumbai Indians'), ('win_by_runs', '0'), ('win_by_wickets', '5'), ('player_of_match', 'RG Sharma'), ('venue', 'Wankhede Stadium'), ('umpire1', 'AK Chaudhary'), ('umpire2', 'CB Gaffaney'), ('umpire3', '')])]
 */


//MARK: - Table View extension

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Messages.count
        //return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = Messages[indexPath.row]
        
        if message.type == "user" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
            cell.messageLabel.text = message.message
            return cell
        }
        
        else if message.type == "bot" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "botCell", for: indexPath) as! BotCell
            cell.messageLabel.text = message.message
            return cell
        }
        
        else if message.type == "search" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchCell
            return cell
        }
        
        else if message.type == "profile" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileCell
            return cell
        }
        
        else if message.type == "stats" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "statsCell", for: indexPath) as! StatsCell
            var team = data.teamA
            var teamData = stats.fetch(input: team)
            cell.teamNane.text = team
            cell.matchesValue.text = String(teamData.matches)
            cell.winValue.text = String(teamData.win)
            cell.lossValue.text = String(teamData.loss)
            cell.winPercent.text = String(teamData.winPercent)
            cell.teamLogo.image = UIImage(named: team)
            return cell
        }
        
        else if message.type == "match" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as! MatchCell
            matches()
            cell.winnerName.text = stats.short(input: data.teamA)
            cell.loserName.text = stats.short(input: data.teamB)
            cell.city.text = data.city
            cell.date.text = data.year
            cell.loserScore.text = ""
            cell.winnerScore.text = ""
            cell.winnerLogo.image = UIImage(named: data.teamA)
            cell.loserLogo.image = UIImage(named: data.teamB)
            cell.remark.text = "\(data.winner) won."
            return cell
        }
        
        else if message.type == "live" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as! MatchCell
            //query
            cell.winnerName.text = "SRH"
            cell.loserName.text = "RR"
            cell.city.text = "Abu Dhabi"
            cell.date.text = "Today"
            cell.loserScore.text = ""
            cell.winnerScore.text = ""
            cell.winnerLogo.image = UIImage(named: "Sunrisers Hyderabad")
            cell.loserLogo.image = UIImage(named: "Rajasthan Royals")
            cell.remark.text = "Yet to start"
            return cell
        }
        
        else if message.type == "predict" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell", for: indexPath) as! MatchCell
            predict()
            cell.winnerName.text = stats.short(input: data.teamA)
            cell.loserName.text = stats.short(input: data.teamB)
            cell.loserScore.text = ""
            cell.winnerScore.text = ""
            cell.date.text = ""
            cell.city.text = ""
            cell.remark.text = "Winning probability: \(data.prediction.prefix(5))"
            cell.winnerLogo.image = UIImage(named: data.teamA)
            cell.loserLogo.image = UIImage(named: data.teamB)
            return cell
        }
        
        else if message.type == "list" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! ListCell
            matches()
            if message.message == "schedule" {
                cell.team1A.text = "SRH"
                cell.team1B.text = "RR"
                cell.day1.text = "Today"
                cell.day2.text = "Today"
                cell.day3.text = "Today"
                cell.team2A.text = "MI"
                cell.team2B.text = "DC"
                cell.team3A.text = "RCB"
                cell.team3B.text = "KKR"
                cell.remark1.text = "Yet to start"
                cell.remark2.text = "Yet to start"
                cell.remark3.text = "Yet to start"
                
            } else {
                cell.team2A.text = stats.short(input: data.teamA)
                cell.team2B.text = stats.short(input: data.teamB)
                cell.team3A.text = stats.short(input: data.teamA)
                cell.team3B.text = stats.short(input: data.teamB)
                cell.team1A.text = stats.short(input: data.teamA)
                cell.team1B.text = stats.short(input: data.teamB)
                cell.day1.text = data.year
                cell.day2.text = data.year2
                cell.day3.text = data.year3
                
                cell.remark1.text = "\(data.winner) won."
                cell.remark2.text = "\(data.winner2) won."
                cell.remark3.text = "\(data.winner3) won."
            }
            
            
            //cell.
            
            return cell
        }
        
        else if message.type == "info" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoCell
            cell.logo.image = UIImage(named: data.teamA)
            cell.urlButton.setTitle(stats.links(input: message.message), for: .normal)
            if message.message == "globe" {
                cell.icon.isHidden = false
            } else {
                cell.icon.isHidden = true
            }
            return cell
            
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as! FilterCell
            let id = message.message
            cell.object = id
            if id == "player" {
                cell.pickerData = players
            }
            else if id == "year" {
                cell.pickerData = years
            }
            else if id == "city" {
                cell.pickerData = cities
            }
            else {
                cell.pickerData = teams
            }
            
            return cell
        }
    }
}

