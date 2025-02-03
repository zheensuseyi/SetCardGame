//
//  ContentView.swift
//  SetCardGame
//
//  Created by Zheen Suseyi on 2/2/25.
//

import SwiftUI
// possible ways to display the card contents on my contentview
// 1. isolate each variable in cardcontent, and use them as modifers?


// FIXME: Render the starting deck and display it here in the view
// Best way to do that would be to make a ShapeView Struct that gets called upon in a ForEach loop in the view.
struct ContentView: View {
    @ObservedObject var vm: SetCardGameViewModel = SetCardGameViewModel(model: SetCardGame())
    var body: some View {
        Text("Hello World")
    }
}

struct ShapeView {
    var shape: Shape
    var shading: Shading
    var color: Color
}
#Preview {
    ContentView()
}
