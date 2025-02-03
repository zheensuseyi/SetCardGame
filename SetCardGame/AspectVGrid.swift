import SwiftUI
struct AspectVGrid: View {
    @ObservedObject var vm: SetCardGameViewModel
    var body: some View {
        GeometryReader { geometry in
            let gridItemSize = vm.gridItemWidthThatFits(
                count: vm.currentDeck.count,
                size: geometry.size,
                aspectRatio: 1
            )
            LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 10)], spacing: 10) {
                ForEach(vm.currentDeck, id: \.self) { element in
                    ShapeInitializationView(shape: element.shape, color: element.color, shading: element.shading, numberOfShapes: element.numberOfShapes)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 300)
        }
        .padding()
    }
}
