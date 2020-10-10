//
//  ViewController.swift
//  chatbot
//
//  Created by Swamita on 09/10/20.
//

import UIKit

class ChatViewController: UIViewController {
    
    var Messages : [Message] = []
    var messageBrain = MessageBrain()

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var button1: RoundedButton!
    @IBOutlet weak var button2: RoundedButton!
    @IBOutlet weak var button3: RoundedButton!
    @IBOutlet weak var button4: RoundedButton!
    @IBOutlet weak var button5: RoundedButton!
    @IBOutlet weak var button6: RoundedButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "userCell")
        tableView.register(UINib(nibName: "BotCell", bundle: nil), forCellReuseIdentifier: "botCell")
        
    }

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
            let userMessage = Message(message: request.userMessage, bot: false)
            let botMessage = Message(message: request.botMessage, bot: true)
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
        }
        
    }
    
    @IBAction func askPressed(_ sender: Any) {
    }
    
}

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = Messages[indexPath.row]
        if message.bot == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
            cell.messageLabel.text = message.message
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "botCell", for: indexPath) as! BotCell
            cell.messageLabel.text = message.message
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

