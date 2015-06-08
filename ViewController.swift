//
//  ViewController.swift
//  Hi-Lo
//
//  Created by F2M2 Dev 1 on 5/19/15.
//  Copyright (c) 2015 F2M2, Inc. All rights reserved.
//

import UIKit

enum SelectionState {
    case Higher
    case Lower
    case Yes
    case No
}


class ViewController: UIViewController {
    @IBOutlet weak var scoreTxt: UILabel!
    @IBOutlet weak var deckTxt: UILabel!
    @IBOutlet weak var highBtn: UIButton!
    @IBOutlet weak var lowBtn: UIButton!
    
    var cards: [Int] = []
    var currentStreak: Int = 0 {
        didSet{
            scoreTxt.text = "\(currentStreak)"

        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        newGame()

    }
    
    
    func newGame() {
        generateDeck()
        currentStreak = 0
        
         deckTxt.text = "\(cards[currentStreak])"
    }
    
    func gameOver() {
        self.performSegueWithIdentifier("gameOver", sender: self)
    }
    
    @IBAction func selectLower(sender: UIButton) {
        lowBtn.hidden = false
        determineIfCorrect(.Lower)
    }
    @IBAction func selectHigher(sender: UIButton) {
        highBtn.hidden = false
        determineIfCorrect(.Higher)
    }
    
    func determineIfCorrect(selectionState:SelectionState) {
        
        let currentCard: Int = cards[currentStreak]
        let nextCard: Int = cards[currentStreak + 1]
        
        deckTxt.text = "\(nextCard)"
    
        if selectionState == .Higher && (currentCard < nextCard) {
            currentStreak++
        } else if selectionState == .Lower && (currentCard > nextCard) {
            currentStreak++
        } else {
            gameOver()
        }
    }
    
 
    func generateDeck() {
        cards.removeAll(keepCapacity: false)
        
        // create cards
        var n:Int = 1
        for i in 1..<53 {
            cards.append(n)
            n++
            if n > 13 {
                n = 1
            }
        }
        cards = shuffle(cards)
    }
    
    func shuffle(deck: [Int]) ->[Int] {
        let count = deck.count
        var shuffledCards: [Int] = []
        
        for index in 0..<count {
            var randNum = Int(arc4random_uniform(UInt32(count - index)))
            if index % 2 == 0 {
                shuffledCards.append(deck[randNum])
            } else {
                shuffledCards.append(deck[randNum + 1])
            }

        }
        return shuffledCards
    }
    
}



