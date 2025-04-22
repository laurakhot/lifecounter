//
//  ViewController.swift
//  lifecounter
//
//  Created by Laura Khotemlyansky on 4/19/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        losingLabel.isHidden = true
    }
    
    var playerOneLifeVal = 20
    var playerTwoLifeVal = 20
    
    @IBOutlet weak var playerOneLifeLabel: UILabel!
    
    @IBOutlet weak var playerTwoLifeLabel: UILabel!
    
    @IBOutlet weak var losingLabel: UILabel!

    @IBAction func playerOnePlusTapped(_ sender: UIButton) {
        playerOneLifeVal += 1
        updateLifeLabels()
    }
    
    @IBAction func playerOnePlusFiveTapped(_ sender: UIButton) {
        playerOneLifeVal += 5
        updateLifeLabels()
    }
    
    @IBAction func playerOneMinusOneTapped(_ sender: UIButton) {
        playerOneLifeVal -= 1
        updateLifeLabels()
    }
    
    @IBAction func playerOneMinusFiveTapped(_ sender: UIButton) {
        playerOneLifeVal -= 5
        updateLifeLabels()
    }
    
    @IBAction func playerTwoPlusTapped(_ sender: UIButton) {
        playerTwoLifeVal += 1
        updateLifeLabels()
    }
    
    @IBAction func playerTwoPlusFiveTapped(_ sender: UIButton) {
        playerTwoLifeVal += 5
        updateLifeLabels()
    }
    
    @IBAction func playerTwoMinusTapped(_ sender: UIButton) {
        playerTwoLifeVal -= 1
        updateLifeLabels()
    }
    
    @IBAction func playerTwoMinusFiveTapped(_ sender: UIButton) {
        playerTwoLifeVal -= 5
        updateLifeLabels()
    }
    
    func updateLifeLabels() {
        if playerOneLifeVal <= 0 {
            losingLabel.text = "Player One LOSES!"
            losingLabel.isHidden = false
            playerOneLifeVal = 20
            playerTwoLifeVal = 20
        }
        if playerTwoLifeVal <= 0 {
            losingLabel.text = "Player Two LOSES!"
            losingLabel.isHidden = false
            playerOneLifeVal = 20
            playerTwoLifeVal = 20
        }
        playerOneLifeLabel.text = "\(playerOneLifeVal)"
        playerTwoLifeLabel.text = "\(playerTwoLifeVal)"
    }
    
   
}

