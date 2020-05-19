//  ViewController.swift
//  WarCardGame
//
//  Created by Sean Low on 19/5/20.
//  Guide at the link below:
//  https://www.youtube.com/watch?v=09TeUXjzpKs

import UIKit

// subclass ViewController has super class UIViewController
class ViewController: UIViewController {

    // Links to left card
    @IBOutlet weak var leftImageView: UIImageView!
    
    // Links to right card
    @IBOutlet weak var rightImageView: UIImageView!
    
    // Links to left player score
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    // Links to right CPU score
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    // Links to tie image
    @IBOutlet weak var tieImage: UIImageView!
    
    
    var leftScore = 0
    var rightScore = 0
    
    var oldLeftCardNumber = 0
    var oldRightCardNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func dealTapped(_ sender: Any) {
        var leftCardNumber: Int
        var rightCardNumber: Int
        
        // Picks a random card from Ace to King while also ensuring that numbers are not repeated after each draw
        repeat {
            leftCardNumber = Int.random(in: 2...14)
        } while leftCardNumber == oldLeftCardNumber
        
        repeat {
            rightCardNumber = Int.random(in: 2...14)
        } while rightCardNumber == oldRightCardNumber
        
        oldRightCardNumber = rightCardNumber
        oldLeftCardNumber = leftCardNumber
        
        
        // Updates the images after each time 'Deal' is clicked
        leftImageView.image = UIImage(named: "card\(leftCardNumber)")
        rightImageView.image = UIImage(named: "card\(rightCardNumber)")
        
        // Updates the score depending on who is higher
        if (rightCardNumber < leftCardNumber) {
            leftScore += 1
            leftScoreLabel.text = String(leftScore)
            tieImage.image = nil
        } else if (leftCardNumber < rightCardNumber) {
            rightScore += 1
            rightScoreLabel.text = String(rightScore)
            tieImage.image = nil
        } else {
            // If tie, shows a 'tie' image
            tieImage.image = UIImage(named: "tie")
        }
    }
}

