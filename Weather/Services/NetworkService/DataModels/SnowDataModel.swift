//
//  SnowDataModel.swift
//  Weather
//
//  Created by Michael Khavin on 23.08.2022.
//

import Foundation

struct SnowDataModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
        case threeHours = "3h"
    }
    
    let oneHour: Double?
    let threeHours: Double?
}
