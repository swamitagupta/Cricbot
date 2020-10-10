//
//  TextViewController.swift
//  chatbot
//
//  Created by Swamita on 10/10/20.
//

import UIKit

class TextViewController: UIViewController {
    
    var Messages : [Text] = []

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var micButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "userCell")
        tableView.register(UINib(nibName: "BotCell", bundle: nil), forCellReuseIdentifier: "botCell")

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
