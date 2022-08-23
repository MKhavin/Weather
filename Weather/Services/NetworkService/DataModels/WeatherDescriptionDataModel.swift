//
//  WeatherDescriptionDataModel.swift
//  Weather
//
//  Created by Michael Khavin on 23.08.2022.
//

import Foundation

struct WeatherDescriptionDataModel: Decodable {
    let main: String
    let description: String
}
