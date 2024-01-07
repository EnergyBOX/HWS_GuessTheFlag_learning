import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Color.blue
                Color.yellow
            }
            
            Text("Ukraine")
                .foregroundStyle(.foreground)
        }
        .background(.red)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
