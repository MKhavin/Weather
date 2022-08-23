//
//  CurrentWeatherDataModel.swift
//  Weather
//
//  Created by Michael Khavin on 23.08.2022.
//

import Foundation

struct CurrentWeatherDataModel: Decodable {
    struct SunriseSunsetDataModel: Decodable {
        let sunrise: Int
        let sunset: Int
    }
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temperature = "main"
        case wind
        case clouds
        case rain
        case snow
        case sunriseSunset = "sys"
        case cityName = "name"
    }
    
    let weather: [WeatherDescriptionDataModel]
    let temperature: TemperatureDataModel
    let wind: WindDataModel
    let clouds: CloudsDataModel?
    let rain: RainDataModel?
    let snow: SnowDataModel?
    let sunriseSunset: SunriseSunsetDataModel
    let cityName: String
}
