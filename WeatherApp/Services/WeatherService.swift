//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Pavan Kumar on 03/05/20.
//  Copyright © 2020 Pavan Kumar. All rights reserved.
//

import Foundation

class WeatherService {
  
  func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
    guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=64184889cbb70eaa242683de74372033&units=metric") else {
      completion(nil)
      return
    }
    
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard let data = data else {
        completion(nil)
        return
      }
      
      if let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data) {
        completion(weatherResponse.main)
      }
      completion(nil)
    }.resume()
  }
}
