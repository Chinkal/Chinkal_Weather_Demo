//
//  CityInterector.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 11/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

class CityInterector : CityInteractorInterface{
    
    // MARK: - CityInteractorDelegate
    func downloadWeatherForecast(_ requestType: UInt, httpmethod: String, lat: String, long: String, Delegate: DataDownloadCompletionDelegate) {
        return ApiHandler.downloadWeatherForecast(requestType, httpmethod: httpmethod, lat: lat, long: long, Delegate: Delegate)
    }
}

