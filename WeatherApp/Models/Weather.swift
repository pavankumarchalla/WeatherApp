//
//  Weather.swift
//  WeatherApp
//
//  Created by Pavan Kumar on 03/05/20.
//  Copyright © 2020 Pavan Kumar. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
  let main: Weather
}

struct Weather: Decodable {
  var temp: Double?
  var humidity: Double?
}
