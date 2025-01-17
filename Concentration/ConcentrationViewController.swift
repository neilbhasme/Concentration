//
//  ViewController.swift
//  Concentration
//
//  Created by Neil R.Bhasme on 28/03/2019.
//  Copyright © 2019 Neil R.Bhasme. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {

    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCard )
    
    var numberOfPairsOfCard: Int {
            return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount = 0{
        didSet{
          setFlipCountLebel()
        }
    }
    
    private func setFlipCountLebel(){
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth : 5.0,
            .strokeColor : #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
            
        ]
        let attributedString = NSAttributedString(string: "Flips : \(flipCount)", attributes: attributes)
        //flipCountLabel.text = "Flips : \(flipCount)"
        flipCountLabel.attributedText = attributedString
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            setFlipCountLebel()
        }
    }
    
    var theme: Array<String>? {
        didSet {
            //print(theme)
            let eachEmojiInArray = theme![0].map( {String($0) } )
            emojiChoices = eachEmojiInArray
            emojiChoicesAll = eachEmojiInArray
            emoji = [:] //resetting or actually creating empty dictionary
            updateViewFromModel()
        }
    }
    
    private var emojiChoices: Array<String> = ["🎃","👻","🤡","💩","👹","💂🏼‍♂️","👀","👑","🦋"]
    private var emojiChoicesAll: Array<String> = ["🎃","👻","🤡","💩","👹","💂🏼‍♂️","👀","👑","🦋"]
    
    @IBAction func resetGamme(_ sender: UIButton) {
         print("reset clicked!!")
        game.resetCards()
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCard )
        emoji.removeAll()
        emojiChoices.removeAll()
        emojiChoices = emojiChoicesAll
        updateViewFromModel()
        flipCount = 0
    }
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            //flipCard(withEmogi: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
        } else {
            print("card number gone wrong!!")
        }
       // flipCard(withEmogi: "👻", on: sender)
    }
 
    private func updateViewFromModel() {
        if cardButtons != nil {
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp {
                    button.setTitle(emogi (for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
                } else {
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 0.4457350385, green: 0.848938609, blue: 1, alpha: 1)
                }
            }
        }
    }

    private var emoji = [Int:String]() // same as Dictionary<Int, String>() like  a hashmap kinda
    
    private func emogi(for card: Card) -> String {
        if emoji[card.identifier] == nil,  emojiChoices.count > 0 {
                let randomIndex = emojiChoices.count.arc4randomnrb //How to write and use extensions is here
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        /*
        if emoji[card.identifier] != nil {
            return emoji[card.identifier]!
        } else {
            return "?"
        }
        */
        return emoji[card.identifier] ?? "?" //THis is same as full above
    }
}

extension Int {
    var arc4randomnrb: Int{
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
