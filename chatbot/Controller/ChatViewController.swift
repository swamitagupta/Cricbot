//
//  ViewController.swift
//  chatbot
//
//  Created by Swamita on 09/10/20.
//

import UIKit

class ChatViewController: UIViewController {
    
    var Messages : [Message] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "userCell")
        tableView.register(UINib(nibName: "BotCell", bundle: nil), forCellReuseIdentifier: "botCell")
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.hideKeyboardWhenTappedAround()
        
    }

    @IBAction func latestPressed(_ sender: UIButton) {
        Messages.append(Message(message: "Latest", bot: false))
        Messages.append(Message(message: "Fetching latest...", bot: true))
        tableView.reloadData()
        let indexPath = IndexPath(row: self.Messages.count-1 , section: 0)
        self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    @IBAction func matchesPressed(_ sender: UIButton) {
        Messages.append(Message(message: "Matches", bot: false))
        Messages.append(Message(message: "Fetching matches...", bot: true))
        tableView.reloadData()
        let indexPath = IndexPath(row: self.Messages.count-1 , section: 0)
        self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    @IBAction func teamPressed(_ sender: Any) {
        Messages.append(Message(message: "Teams", bot: false))
        Messages.append(Message(message: "Fetching teams...", bot: true))
        tableView.reloadData()
        let indexPath = IndexPath(row: self.Messages.count-1 , section: 0)
        self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
