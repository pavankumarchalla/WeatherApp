//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Pavan Kumar on 03/05/20.
//  Copyright © 2020 Pavan Kumar. All rights reserved.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
  
  private var weatherService: WeatherService!
  
  @Published var weather = Weather()
  
  init() {
    self.weatherService = WeatherService()
  }
  
  var temperature: String {
    if let temp = weather.temp {
      return String(format: "%.0f", temp)
    }
    return ""
  }
  
  var humidity: String {
    if let humid = weather.humidity {
      return String(format: "%.0f", humid)
    }
    return ""
  }
  
  var cityName: String = ""
  
  func search() {
    if let city = cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
      fetchWeather(city: city)
    }
  }
  
  private func fetchWeather(city: String) {
    self.weatherService.getWeather(city: city) { (weather) in
      if let weather = weather {
        DispatchQueue.main.async {
          self.weather = weather
        }
      }
    }
  }
  
}
