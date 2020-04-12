//
//  CurrentWeather.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 11/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit


struct current : Decodable{
    var dt : Double?
    var temp : Double?
    var pressure : Double?
    var humidity : Double?
    var wind_speed : Double?
    var weather : [weather]
    
}

struct weather :Decodable {
    var description : String?
    var icon : String?
}

struct daily :Decodable {
    var dt : Double?
    var temp : temp
    var weather : [weather]
}

struct temp :Decodable {
    var day : Double?
    var night : Double?

}

