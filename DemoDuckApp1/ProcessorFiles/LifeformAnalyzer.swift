import SwiftUI

struct ContentView: View {
    let lifeformAnalyzer = LifeformAnalyzer()
    @State var text = "" 
    @State var title = "Hello Human!"
    //@State var color = ""
    var color = Color(red: 0, green: 0.100, blue: 0.10)
    
    var body: some View {
        VStack {
            Image(systemName: "face.smiling.fill")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .padding(.top, 50)
            
            Text(title)
                .font(.largeTitle)
            
            Spacer()
            
            //using $ in field below because input can change the variable
            TextField("enter here", text: $text)
                .multilineTextAlignment(.center)
                .frame(width: 300)
            
            Spacer()
            
            //var color = ColorPicker("Choose bg color", selection: color)
                
            Button("Submit")
            {
                submit()
            }
            
            Spacer()
            
            //Color.orange
                
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0, green: 0.100, blue: 0.10))
        .ignoresSafeArea()
    }
    
    func submit()
    {
        title = "Hello \(lifeformAnalyzer.processLifeform(text:text))!"
    }
}
