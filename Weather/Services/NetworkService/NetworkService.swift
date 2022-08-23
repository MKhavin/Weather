//
//  NetworkService.swift
//  Weather
//
//  Created by Michael Khavin on 22.08.2022.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    var delegate: NetworkServiceDelegateProtocol? { get set }
    func getCurrentWeather(longtitude: String, latitude: String)
    func getCurrentWeather(of city: String)
    func getForecastWeather(longtitude: String, latitude: String)
    func getForecastWeather(of city: String)
}

protocol NetworkServiceDelegateProtocol: AnyObject {
    func showError(message: String)
    func weatherDataDidLoad<T: Decodable>(_ weatherData: T)
}

class NetworkService: NetworkServiceProtocol {
    //MARK: - Sub properties
    var delegate: NetworkServiceDelegateProtocol?
    
    private var apiKey: String {
        let key: [UInt8] = [0x30, 0x35, 0x30,
                            0x37, 0x61, 0x35,
                            0x65, 0x38, 0x30,
                            0x38, 0x35, 0x32,
                            0x37, 0x63, 0x32,
                            0x31, 0x39, 0x64,
                            0x30, 0x35, 0x32,
                            0x61, 0x33, 0x32,
                            0x62, 0x32, 0x63,
                            0x63, 0x30, 0x36,
                            0x39, 0x34]

        let data = Data(key)
        
        return String(data: data, encoding: .utf8) ?? ""
    }
    
    //MARK: - Networking methods
    private func getCurrentWeatherURLComponents(with path: String) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.openweathermap.org"
        urlComponents.path = path
        
        let apiKeyItem = URLQueryItem(name: "appid", value: apiKey)
        
        var measurementItem: URLQueryItem
        if let measurement = SettingsManager.shared.getValue(of: .temperature),
           let value = SettingsProperties.SettingValues(rawValue: measurement),
           value == .farenheit {
            measurementItem = URLQueryItem(name: "units", value: "imperial")
        } else {
            measurementItem = URLQueryItem(name: "units", value: "metric")
        }
    
        urlComponents.queryItems = [measurementItem, apiKeyItem]
        
        return urlComponents
    }
    
    private func executeRequest<T: Decodable>(with url: URL, for type: T.Type) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if error != nil {
                self?.delegate?.showError(message: "Error occured. Error message: \(error!.localizedDescription)'nPlease, contact with developer.")
                return
            }
            
            if let urlResponse = response as? HTTPURLResponse,
               urlResponse.statusCode != 200 {
                self?.delegate?.showError(message: "Error occured. Status code: \(urlResponse.statusCode)\nPlease, contact with developer.")
                return
            }
               
            guard let unwrappedData = data else {
                self?.delegate?.showError(message: "Error occured. Server return incorrect weather data.\nPlease, contact with developer.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                let weatherData = try decoder.decode(type.self, from: unwrappedData)
                
                self?.delegate?.weatherDataDidLoad(weatherData)
            } catch {
                self?.delegate?.showError(message: "Error occured. Error message: \(error.localizedDescription)'nPlease, contact with developer.")
            }
        }
        
        task.resume()
    }
    
    //MARK: - Current weather methods
    func getCurrentWeather(longtitude: String, latitude: String) {
        var urlComponents = getCurrentWeatherURLComponents(with: "/data/2.5/weather")
        
        let longtitudeItem = URLQueryItem(name: "lon", value: longtitude)
        let latitudeItem = URLQueryItem(name: "lat", value: latitude)
        
        urlComponents.queryItems?.append(contentsOf: [longtitudeItem, latitudeItem])
        
        guard let url = urlComponents.url else {
            return
        }
        
        executeRequest(with: url, for: CurrentWeatherDataModel.self)
    }
    
    func getCurrentWeather(of city: String) {
        var urlComponents = getCurrentWeatherURLComponents(with: "/data/2.5/weather")
        
        let cityItem = URLQueryItem(name: "q", value: city)
        
        urlComponents.queryItems?.append(cityItem)
        
        guard let url = urlComponents.url else {
            return
        }
        
        executeRequest(with: url, for: CurrentWeatherDataModel.self)
    }
    
    //MARK: - Forecast weather methods
    func getForecastWeather(longtitude: String, latitude: String) {
        var urlComponents = getCurrentWeatherURLComponents(with: "/data/2.5/forecast")
        
        let longtitudeItem = URLQueryItem(name: "lon", value: longtitude)
        let latitudeItem = URLQueryItem(name: "lat", value: latitude)
        
        urlComponents.queryItems?.append(contentsOf: [longtitudeItem, latitudeItem])
        
        guard let url = urlComponents.url else {
            return
        }
        
        executeRequest(with: url, for: ForecastWeatherDataModel.self)
    }
    
    func getForecastWeather(of city: String) {
        var urlComponents = getCurrentWeatherURLComponents(with: "/data/2.5/forecast")
        
        let cityItem = URLQueryItem(name: "q", value: city)
        
        urlComponents.queryItems?.append(cityItem)
        
        guard let url = urlComponents.url else {
            return
        }
        
        executeRequest(with: url, for: ForecastWeatherDataModel.self)
    }
}
