//
//  ViewController.swift
//  Hi-Lo
//
//  Created by F2M2 Dev 1 on 5/19/15.
//  Copyright (c) 2015 F2M2, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var Deck: UILabel!
    
    @IBAction func selectLower(sender: AnyObject) {
        selection = .Lower
        isCorrect()
    }
    @IBAction func selectHigher(sender: AnyObject) {
        selection = .Higher
        isCorrect()
    }
    var selection: selectionState = .Higher
    var cards: [Int] = []
    var i: Int = 0
    var currentStreak: Int = 0 {
        didSet{
            
            /// update my interface
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        newGame()

    }
    
    
    func newGame() {
        generateDeck()
        currentStreak = 0
    }
    
    func gameOver() {
        
    }
    
    func isCorrect() {
        var currentCard: Int = cards[i]
        var nextCard: Int = cards[i + 1]
    
        if selection == .Higher && (currentCard > nextCard) {
            i++
            //println(cards[i])
            currentStreak++
        } else if selection == .Lower && (currentCard < nextCard) {
            gameOver()
        } else if currentCard == nextCard{
            gameOver()
        }
    }
    
    enum selectionState {
        case Higher
        case Lower
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
            if index % 2 == 0 {
                shuffledCards.append(deck[(count / 7) + (index / 7)])
            } else {
                shuffledCards.append(deck[(index - 1)/5])
            }

        }
        return shuffledCards
    }
    
}



