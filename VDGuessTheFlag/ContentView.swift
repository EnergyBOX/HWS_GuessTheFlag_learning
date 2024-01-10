import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Some content")
            .frame(maxWidth: 90, maxHeight: 90)
            .foregroundStyle(.yellow)
            .background(.blue.gradient)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
