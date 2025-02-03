//
//  SetCardGameViewModel.swift
//  SetCardGame
//
//  Created by Zheen Suseyi on 2/2/25.
//

import SwiftUI

class SetCardGameViewModel: ObservableObject {
    var model: SetCardGame
    init(model: SetCardGame) {
        self.model = model
    }
    var cardDeck: Array<SetCardGame.Card<Shape, Shading, Color>> {
        return model.cardDeck
    }
    var startingDeck: Array<SetCardGame.Card<Shape, Shading, Color>> {
        return model.startingDeck
    }
}

