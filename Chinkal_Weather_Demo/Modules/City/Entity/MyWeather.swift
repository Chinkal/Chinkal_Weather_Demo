//
//  MyWeather.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 11/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

class MyWeather :Decodable {
    var current : current
    var daily : [daily]
}

extension MyWeather: CityItemInterface {
    var cityName: String? {
        if let cityname = LocationManager.shared.cityName{
            return cityname
        }else {
            return nil
        }
    }
    
    var icon: String? {
        return current.weather[0].icon
    }

    var temp: Double? {
        return current.temp
    }
}

extension MyWeather: WeatherItemInterface {
    var city: String? {
      if let cityname = LocationManager.shared.cityName{
            return cityname
        }else {
            return nil
        }
    }

    var humidity: Double? {
        return current.humidity
    }
    
    var wind: Double? {
        return current.wind_speed
    }
    
    var pressure: Double? {
        return current.pressure
    }
    
}

extension daily: WeatherItemInterfaceForCollection {
    var date: Double? {
        return dt
    }
    
    var dayTempareture: Double? {
        return temp.day
    }
    
    var iconOfEachDay: String? {
        return weather[0].icon
    }

}



