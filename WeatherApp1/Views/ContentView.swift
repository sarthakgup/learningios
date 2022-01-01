import SwiftUI

struct ContentView: View {
    //init locationManager
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location
            {
                if let weather = weather
                {
                    Text("got weather data")
                    WeatherView(weather: weather)
                }
                else
                {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude:location.latitude, longitude: location.longitude)
                            }
                            catch
                            {
                                print("error getting weather data: \(error)")
                            }
                        }
                }
                
                //displaying user location for testing
                //Text("Your coordinates are: \(location.longitude), \(location.latitude)")
            }
            else
            {
                if locationManager.isLoading
                {
                    LoadingView()
                }
                else
                {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}
