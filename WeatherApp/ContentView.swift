//
//  ContentView.swift
//  WeatherApp
//
//  Created by Pavan Kumar on 03/05/20.
//  Copyright © 2020 Pavan Kumar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var weatherVm: WeatherViewModel
  
  init() {
    weatherVm = WeatherViewModel()
  }
  
    var body: some View {
      VStack(alignment: .center) {
        
        Text(weatherVm.temperature)
          .font(.custom("Arial", size: 100))
          .foregroundColor(Color.white)
          .offset(y: -100)
          .padding()

        
        TextField("Enter city name", text: $weatherVm.cityName) {
          self.weatherVm.search()
        }.font(.custom("Arial", size: 50))
          .padding()
          .fixedSize()
          .multilineTextAlignment(.center)
          .offset(y: -30)
        
      }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
