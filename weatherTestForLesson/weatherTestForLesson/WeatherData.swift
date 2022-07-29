//
//  WeatherData.swift
//  weatherTestForLesson
//
//  Created by Sergey Pavlov on 22.07.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct WeatherData: Codable {
    var coord: Coord = Coord()
    var weather: [Weather] = []
    var main: Main = Main()
    var id: Int = 0
    var name: String = ""
}


// MARK: - Coord
struct Coord: Codable {
    var lon: Double = 0.0
        var lat: Double = 0.0
}

// MARK: - Main
struct Main: Codable {
    var temp = 0.0
    var feelsLike = 0.0
    var tempMin = 0.0
    var tempMax = 0.0
    var pressure = 0
    var humidity = 0

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Weather
struct Weather: Codable {
    var id: Int = 0
    var main = ""
    var weatherDescription = ""
    var icon = ""

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

