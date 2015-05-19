//
//  ViewController.swift
//  Hi-Lo
//
//  Created by F2M2 Dev 1 on 5/19/15.
//  Copyright (c) 2015 F2M2, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var streak: UILabel!
    @IBOutlet weak var currentCard: UILabel!

    
    var cards: [Int] = []
    var currentStreak: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupGame()
    }
    
    
    func setupGame() {
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
        isHigher()
    }
    
    
    func shuffle(deck: [Int]) ->[Int] {
        let count = deck.count
        var shuffledCards: [Int] = []
        
        for index in 0..<count {
            if index % 2 == 0 {
                shuffledCards.append(deck[(count / 2) + (index / 2)])
            } else {
                shuffledCards.append(deck[(index - 1)/2])
            }
        }
        
        return shuffledCards
    }
    
    func isHigher() ->Bool {
        for (index, value) in enumerate(cards) {
            println("Item \(index): \(value)")
            if value > (value + 1){
                return true
            }
            
        }
        return false
    }
    
    func isLower() ->Bool {
        return true
    }
    
    func isMatchOver() ->Bool {
        if !isHigher() {
            return false
        } else if !isLower(){
            return false
        }
        return true
    }
    

    
}



