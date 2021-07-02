//
//  Forecast.swift
//  WeatherApp
//
//  Created by Quang Bao on 02/07/2021.
//

import SwiftUI

//Sample Model and ten days data....

struct DayForecast: Identifiable{
    var id = UUID().uuidString
    var day: String
    var farenheit: CGFloat
    var image: String
}

var forecast = [
    
    DayForecast(day: "Today", farenheit: 35, image: "sun.min"),
    DayForecast(day: "Today", farenheit: 35, image: "sun.min"),
    DayForecast(day: "Today", farenheit: 35, image: "sun.min"),
    DayForecast(day: "Today", farenheit: 35, image: "sun.min"),
    DayForecast(day: "Today", farenheit: 35, image: "sun.min"),
    DayForecast(day: "Today", farenheit: 35, image: "sun.min"),
    DayForecast(day: "Today", farenheit: 35, image: "sun.min"),
    DayForecast(day: "Today", farenheit: 35, image: "sun.min"),
    DayForecast(day: "Today", farenheit: 35, image: "sun.min"),
    DayForecast(day: "Today", farenheit: 35, image: "sun.min")
]
