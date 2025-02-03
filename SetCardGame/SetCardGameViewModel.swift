//
//  SetCardGameViewModel.swift
//  SetCardGame
//
//  Created by Zheen Suseyi on 2/2/25.
//

import SwiftUI

class SetCardGameViewModel: ObservableObject {
    @Published var model: SetCardGame
    @Published var cardDeck: Array<SetCardGame.Card<CardShape, CardShading, CardColor>>
    @Published var currentDeck: Array<SetCardGame.Card<CardShape, CardShading, CardColor>>
    init(model: SetCardGame) {
        self.model = model
        self.currentDeck = model.currentDeck
        self.cardDeck = model.cardDeck
    }
    func addThreeCards() {
        model.addThreeCards()
        currentDeck = model.currentDeck
    }
   
    
}

extension SetCardGameViewModel {
    func gridItemWidthThatFits(count: Int, size: CGSize, aspectRatio: CGFloat) -> CGFloat {
        let count = CGFloat(count)
        var columnCount = 2.0
        repeat {
            let width = size.width / columnCount
            let height = width / aspectRatio
            
            let rowCount = (count / columnCount).rounded(.up)
            if rowCount * height <= size.height {
                return width.rounded(.down)
            }
            columnCount += 1
        } while columnCount <= count // Ensure columnCount doesn't exceed count
        return (size.width / count)
    }
}
