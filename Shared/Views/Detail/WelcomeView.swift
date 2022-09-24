//
//  WelcomeView.swift
//  weather (iOS)
//
//  Created by Людмила Долонтаева on 13.09.2022.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack{
            VStack(spacing: 20) {
                Text("Welcome to the weather app")
                    .bold().font(.title)
                Text("Please shate your current location to get the weather in your current area")
                    .padding()
            }
            .multilineTextAlignment(.center )
            .padding()
            
            LocationButton(.sendCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
