//
//  ForecastWeatherDataModel.swift
//  Weather
//
//  Created by Michael Khavin on 23.08.2022.
//

import Foundation

struct ForecastWeatherDataModel: Decodable {
    struct CityDataModel: Decodable {
        let name: String
        let sunrise: Int
        let sunset: Int
    }
    
    struct ListItemDataModel: Decodable {
        enum CodingKeys: String, CodingKey {
            case weather
            case temperature = "main"
            case wind
            case clouds
            case rain
            case snow
        }
        
        let weather: [WeatherDescriptionDataModel]
        let temperature: TemperatureDataModel
        let wind: WindDataModel
        let clouds: CloudsDataModel?
        let rain: RainDataModel?
        let snow: SnowDataModel?
    }
    
    let list: [ListItemDataModel]
    let city: CityDataModel
}
