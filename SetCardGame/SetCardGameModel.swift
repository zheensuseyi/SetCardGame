//
//  SetGameModel.swift
//  SetCardGame
//
//  Created by Zheen Suseyi on 2/2/25.
//

import Foundation

// FIXME: Figure out what to do with these global enums
// FIXME: Make code cleaner
struct SetCardGame {
    // Initialize the cardDeck with all possible combinations
    private (set) var cardDeck: Array<Card<CardShape, CardShading, CardColor>>
    private (set) var currentDeck: Array<Card<CardShape, CardShading, CardColor>>
    init() {
        cardDeck = []
        currentDeck = []
        let shapes: [CardShape] = [.square, .triangle, .circle]
        let shadings: [CardShading] = [.solid, .striped, .outlined]
        let colors: [CardColor] = [.red, .green, .purple]
        let numbersOfShapes = [1, 2, 3]
        self.cardDeck = genCardDeck(shapes: shapes, shadings: shadings, colors: colors, numbersOfShapes: numbersOfShapes)
        self.currentDeck = genCurrentDeck()
    }
    private func genCardDeck(shapes: [CardShape], shadings: [CardShading], colors: [CardColor], numbersOfShapes: [Int]) ->  Array<Card<CardShape, CardShading, CardColor>> {
        var cardDeck: [Card<CardShape, CardShading, CardColor>] = []
        for shape in shapes {
            for shading in shadings {
                for color in colors {
                    for number in numbersOfShapes {
                        let card = Card(numberOfShapes: number, shape: shape, shading: shading, color: color)
                        cardDeck.append(card)
                    }
                }
            }
        }
        return cardDeck.shuffled() // Shuffle the deck once during initialization
    }
    
    private mutating func genCurrentDeck() -> Array<Card<CardShape, CardShading, CardColor>> {
        let initialCards = Array(cardDeck.prefix(3)) // Deal initial 12 cards
        cardDeck.removeFirst(3) // Remove them from the deck
        return initialCards
    }
    
    mutating func addThreeCards() {
        var i = 0
        var index = 0
        while i < 3 && index < cardDeck.count {
            if !currentDeck.contains(cardDeck[index]) {
                currentDeck.append(cardDeck[index])
                i += 1
            }
            index += 1
        }
    }
    
    struct Card<CardShape: Hashable, CardShading: Hashable, CardColor: Hashable>: Equatable, Hashable {
        let numberOfShapes: Int
        let shape: CardShape
        let shading: CardShading
        let color: CardColor

        init(numberOfShapes: Int, shape: CardShape, shading: CardShading, color: CardColor) {
            self.numberOfShapes = numberOfShapes
            self.shape = shape
            self.shading = shading
            self.color = color
        }

        static func == (lhs: Card, rhs: Card) -> Bool {
            return lhs.numberOfShapes == rhs.numberOfShapes &&
                   lhs.shape == rhs.shape &&
                   lhs.shading == rhs.shading &&
                   lhs.color == rhs.color
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(numberOfShapes)
            hasher.combine(shape)
            hasher.combine(shading)
            hasher.combine(color)
        }
    }
}



