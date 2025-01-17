//
//  Concentration.swift
//  Concentration
//
//  Created by Neil R.Bhasme on 29/03/2019.
//  Copyright © 2019 Neil R.Bhasme. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter{ cards[$0].isFaceUp}.oneAndOnly  //minuses below with collection only
            
       //     let faceUpCardIndices = cards.indices.filter{ cards[$0].isFaceUp}  this and next line without collections
        //    return faceUpCardIndices.count == 1 ? faceUpCardIndices.first : nil
            
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp{
//                    if foundIndex == nil{
//                        foundIndex = index
//                    } else{
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set {
            for  index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int) {

        assert(cards.indices.contains(index), "Concentration.chooseCard (at index:  \(index)): choosen index is not in the cards")
        
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    func resetCards(){
        cards.removeAll()
    }
    
    init(numberOfPairsOfCards:Int) {
        
        assert(numberOfPairsOfCards > 0, "Concentration.init (\(numberOfPairsOfCards)): you must have atleast one pair of cards")

        for _ in 1...numberOfPairsOfCards{
        let card = Card()
            cards += [card, card]
        }
        cards.shuffle()  //does this work? apparently it does..still check
    }
}
extension Collection{
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
