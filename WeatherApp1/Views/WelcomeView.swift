//
// WelcomeView.swift
// By: Sarthak Gupta
//
// thanks to @Designcode yt tutorial for guidance
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack
        {
            VStack(spacing: 20)
            {
                Text("Simple Weather")
                    .font(.title2)
                    .bold()
                    .padding()
                
                Text("the only weather app you will ever need")
                    .font(.caption)
                    .italic()
                
                Text("please share location for accuracy")
                    .font(.caption2)
                    .bold()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation)
            {
                locationManager.requestLocation()
            }
            .cornerRadius(30)        //round edges of button
            .symbolVariant(.fill)    //fill color in arrow
            .foregroundColor(.white) //text font
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
    
}
