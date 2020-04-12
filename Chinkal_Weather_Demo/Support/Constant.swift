//
//  Constant.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 10/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

struct Constants {
    struct cityCollectionViewBounds{
        static let height = 150
        static let width = 150
    }
    
    struct weatherCollectionViewBounds{
        static let height = 90
        static let width = 127
    }
    
    static var GenericAlert = "Alert"
    static var NoInternet = "Please check your internet connection"

}

struct API {

    static let APIKey = "e7b2054dc37b1f464d912c00dd309595"
    static let BaseURL = String(format: "%@%@", "https://api.openweathermap.org/data/2.5/onecall?appid=",APIKey)
}

