//
//  TextViewController.swift
//  chatbot
//
//  Created by Swamita on 10/10/20.
//

import UIKit
import AWSLex

class TextViewController: UIViewController, AWSLexInteractionDelegate, UITextFieldDelegate {
    
    var interactionKit: AWSLexInteractionKit?
    
    
    var Messages : [Text] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var micButton: UIButton!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if  textField.text != "" {
            sendToLex(text: textField.text!)
            sendMessage(text: textField.text!)
            textField.text = ""
        }
        return true
    }
    
    func interactionKit(_ interactionKit: AWSLexInteractionKit, onError error: Error) {
        print("interactionKit error: \(error)")
    }
    
    func setUpLex(){
        self.interactionKit = AWSLexInteractionKit.init(forKey: "chatConfig")
        self.interactionKit?.interactionDelegate = self
    }
    
    func sendMessage(text : String) {
        Messages.append(Text(content: text, bot: false))
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func receiveMessage(text: String){
        Messages.append(Text(content: text, bot: true))
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
        receiveMessage(text: response)
    //show response on screen
        /*DispatchQueue.main.async{
            var answer = response
            print(answer)
        }*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "userCell")
        tableView.register(UINib(nibName: "BotCell", bundle: nil), forCellReuseIdentifier: "botCell")
        textField.delegate = self
        setUpLex()

    }
    
}

extension TextViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = Messages[indexPath.row]
        if message.bot == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
            cell.messageLabel.text = message.content
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "botCell", for: indexPath) as! BotCell
            cell.messageLabel.text = message.content
            return cell
        }
    }
}

/*
 [OrderedDict([('id', '12'), ('season', '2017'), ('city', 'Bangalore'), ('date', '2017-04-14'), ('team1', 'Royal Challengers Bangalore'), ('team2', 'Mumbai Indians'), ('toss_winner', 'Mumbai Indians'), ('toss_decision', 'field'), ('result', 'normal'), ('dl_applied', '0'), ('winner', 'Mumbai Indians'), ('win_by_runs', '0'), ('win_by_wickets', '4'), ('player_of_match', 'KA Pollard'), ('venue', 'M Chinnaswamy Stadium'), ('umpire1', 'KN Ananthapadmanabhan'), ('umpire2', 'AK Chaudhary'), ('umpire3', '')]), OrderedDict([('id', '37'), ('season', '2017'), ('city', 'Mumbai'), ('date', '2017-05-01'), ('team1', 'Royal Challengers Bangalore'), ('team2', 'Mumbai Indians'), ('toss_winner', 'Royal Challengers Bangalore'), ('toss_decision', 'bat'), ('result', 'normal'), ('dl_applied', '0'), ('winner', 'Mumbai Indians'), ('win_by_runs', '0'), ('win_by_wickets', '5'), ('player_of_match', 'RG Sharma'), ('venue', 'Wankhede Stadium'), ('umpire1', 'AK Chaudhary'), ('umpire2', 'CB Gaffaney'), ('umpire3', '')])]
 */
