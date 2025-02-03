//
//  SetGameModel.swift
//  SetCardGame
//
//  Created by Zheen Suseyi on 2/2/25.
//

import Foundation
// FIXME: Figure out what to do with these global enums
enum Shape {
    case circle, square, triangle
}

enum Shading {
    case solid, striped, outlined
}

enum Color {
    case red, green, purple
}
// FIXME: Make code cleaner
struct SetCardGame {
    // Initialize the cardDeck with all possible combinations
    private (set) var cardDeck: Array<Card<Shape, Shading, Color>>
    private (set) var startingDeck: Array<Card<Shape, Shading, Color>>
    init() {
        cardDeck = []
        startingDeck = []
        let shapes: [Shape] = [.square, .triangle, .circle]
        let shadings: [Shading] = [.solid, .striped, .outlined]
        let colors: [Color] = [.red, .green, .purple]
        let numbersOfShapes = [1, 2, 3]
        self.cardDeck = genCardDeck(shapes: shapes, shadings: shadings, colors: colors, numbersOfShapes: numbersOfShapes)
        self.startingDeck = genStartingDeck(startingDeck)
    }
    // FIXME: Maybe generate both the starting deck and the overall deck in the same function?
    private func genCardDeck(shapes: [Shape], shadings: [Shading], colors: [Color], numbersOfShapes: [Int]) -> [Card<Shape, Shading, Color>] {
        var cardDeck: [Card<Shape, Shading, Color>] = []
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
        return cardDeck
    }
    
    private func genStartingDeck( _ startingDeck: Array<Card<Shape, Shading, Color>>) -> Array<Card<Shape, Shading, Color>> {
        let shuffledDeck = cardDeck.shuffled()
        var startingDeck: Array<Card<Shape, Shading, Color>> = []
        for i in 0...2 {
            startingDeck.append(shuffledDeck[i])
        }
        return startingDeck
    }
    
    struct Card<ShapeType, ShadingType, ColorType>: Identifiable{
        // FIXME: Implement the card logic here
        let id = UUID()
        let numberOfShapes: Int
        let shape: ShapeType
        let shading: ShadingType
        let color: ColorType
        init(numberOfShapes: Int, shape: ShapeType, shading: ShadingType, color: ColorType) {
            self.numberOfShapes = numberOfShapes
            self.shape = shape
            self.shading = shading
            self.color = color
        }
    }
}



