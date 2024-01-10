import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    
    
    var body: some View {
        Button("Show Alert") {
            showAlert = true
        }
        .alert("Some general text", isPresented: $showAlert) {
            Button("Ok") {} // all button every time have ".dismis" inside
        } message: {
            Text("Some optional massage of type View")
        }

    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
