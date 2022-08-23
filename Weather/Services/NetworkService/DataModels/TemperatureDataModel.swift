//
//  TemperatureDataModel.swift
//  Weather
//
//  Created by Michael Khavin on 23.08.2022.
//

import Foundation

struct TemperatureDataModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
    
    let temp: Double
    let feelsLike: Double
    let tempMin: Double
    let tempMax: Double
    let pressure: Int
    let humidity: Int
}
