import SwiftUI

struct ContentView: View {
    @State private var canvasWidth: CGFloat = 300
    @State private var canvasHeight: CGFloat = 300
    @State private var navigateToCanvas = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Choose Canvas Size")
                    .font(.title2)

                HStack {
                    Text("Width:")
                    Slider(value: $canvasWidth, in: 100...1000, step: 10)
                    Text("\(Int(canvasWidth))")
                }

                HStack {
                    Text("Height:")
                    Slider(value: $canvasHeight, in: 100...1000, step: 10)
                    Text("\(Int(canvasHeight))")
                }

                NavigationLink(destination: DrawingView(width:10, height:10), isActive: $navigateToCanvas) {
                    Button("Start Drawing") {
                        navigateToCanvas = true
                    }
                }
            }
            .padding()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
