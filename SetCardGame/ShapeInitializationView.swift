import SwiftUI

struct ShapeInitializationView: View {
    
    let shape: CardShape
    let color: CardColor
    let shading: CardShading
    let numberOfShapes: Int  // Number of shapes on the card
    
    var body: some View {
        HStack {  // Arrange shapes in a row
            ForEach(0..<numberOfShapes, id: \.self) { _ in
                shapeView
                    .foregroundColor(colorValue)
                    .frame(width: 50, height: 50)
                    .opacity(shadingValue)  // Apply shading
            }
        }
    }
    
    
    // Returns the correct shape
    @ViewBuilder
    private var shapeView: some View {
        switch shape {
        case .square:
            Rectangle()
        case .triangle:
            UnevenRoundedRectangle()
        case .circle:
            Circle()
        }
    }
    
    // Correctly assigns a Color
    private var colorValue: Color {
        switch color {
        case .red:
            return Color.red
        case .green:
            return Color.green
        case .purple:
            return Color.purple
        }
    }
    
    private var shadingValue: Double {
        switch shading {
        case .solid:
            return 1
        case .outlined:
            return 0.5
        case .striped:
            return 0.1
        }
    }
    
}
