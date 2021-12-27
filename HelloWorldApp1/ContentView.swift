import SwiftUI

struct ContentView: View {
    
    @State private var showDetails = false
    
    var body: some View {
        VStack
        {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
            
            Button("Show details") {
                showDetails.toggle()
            }
            
            if showDetails {
                Text("HAHA You pressed 'show details'")
                    .font(.largeTitle)
            }
        }
    }
}
