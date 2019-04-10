//
//  Card.swift
//  Concentration
//
//  Created by Neil R.Bhasme on 29/03/2019.
//  Copyright © 2019 Neil R.Bhasme. All rights reserved.
//

import Foundation

struct Card: Hashable {  //equatable am not able to get it working..moving on
    // var hashValue: Int {return identifier}
   /*
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    */
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueItentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueItentifier()
    }
}
