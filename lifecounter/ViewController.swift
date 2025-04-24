//
//  ViewController.swift
//  lifecounter
//
//  Created by Laura Khotemlyansky on 4/19/25.
//

import UIKit

class ViewController: UIViewController {
    
    var gameStarted = false
    var history : [String] = []
    var numPlayers: Int = 4

    override func viewDidLoad() {
        super.viewDidLoad()
        losingLabel.isHidden = true
        for i in 4..<players.count {
            players[i].isHidden = true
        }

    }
    @IBOutlet var lifeLabels: [UILabel]!
    
    @IBOutlet var inputFields: [UITextField]!

    @IBOutlet weak var addPlayer: UIButton!

    @IBOutlet weak var losingLabel: UILabel!
    
    @IBOutlet var players: [UIView]!
    // implement code to add more players to the ui
    @IBAction func addPlayer(_ sender: UIButton) {
        if !gameStarted && numPlayers < players.count {
            players[numPlayers].isHidden = false
            numPlayers += 1
            if numPlayers == players.count {
                addPlayer.isEnabled = false
            }
        }
    }
    
    @IBAction func addLife(_ sender: UIButton) {
        checkButton()
        let index = sender.tag - 1
        var currAmount = Int(lifeLabels[index].text ?? "") ?? 0
        let inputAmount = Int(inputFields[index].text ?? "") ?? 0
        currAmount += inputAmount
        inputFields[index].text = ""
        lifeLabels[index].text = "\(currAmount)"
        history.append("Player \(index + 1) gained \(inputAmount) life")
        checkLoss(for: index)
    }
    
    @IBAction func subtractLife(_ sender: UIButton) {
        checkButton()
        let index = sender.tag - 1
        print(index)
        var currAmount = Int(lifeLabels[index].text ?? "") ?? 0
        let inputAmount = Int(inputFields[index].text ?? "") ?? 0
        currAmount -= inputAmount
        inputFields[index].text = ""
        lifeLabels[index].text = "\(currAmount)"
        history.append("Player \(index + 1) lost \(inputAmount) life")
        checkLoss(for: index)
    }
    
    
    func checkButton() {
        if !gameStarted {
            gameStarted = true
            addPlayer.isEnabled = false
        }
    }

    
    func checkLoss(for index: Int) {
        if let life = Int(lifeLabels[index].text ?? ""), life <= 0 {
            print(life)
            losingLabel.text="Player \(index + 1) lost!"
            losingLabel.isHidden = false
            print(losingLabel.isHidden)
            history.append("Player \(index + 1) lost!")
            resetGame()
        }
    }

    func resetGame() {
        gameStarted = false
        numPlayers = 4
        history = []
        for i in 0..<lifeLabels.count {
            lifeLabels[i].text = "20"
        }
        addPlayer.isEnabled = true
        for i in 4..<players.count {
            players[i].isHidden = true
        }
    }
    
    @IBAction func historyPressed(_ UIButton: Any) {
        performSegue(withIdentifier: "toHistory", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHistory" {
            let destinationVC = segue.destination as? HistoryViewController
            destinationVC?.history = history
        }
    }
    
}
