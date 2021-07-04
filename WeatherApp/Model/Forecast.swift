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
    DayForecast(day: "Mon", farenheit: 36, image: "sun.max.fill"),
    DayForecast(day: "Tue", farenheit: 30, image: "cloud.drizzle"),
    DayForecast(day: "Wed", farenheit: 27, image: "cloud.rain.fill"),
    DayForecast(day: "Thu", farenheit: 29, image: "cloud.sun.rain"),
    DayForecast(day: "Fri", farenheit: 31, image: "cloud.sun.rain.fill"),
    DayForecast(day: "Sat", farenheit: 32, image: "sun.min"),
    DayForecast(day: "Sun", farenheit: 35, image: "sun.max.fill"),
    DayForecast(day: "Mon", farenheit: 33, image: "sun.and.horizon"),
    DayForecast(day: "Tue", farenheit: 35, image: "sun.max.circle.fill")
]
