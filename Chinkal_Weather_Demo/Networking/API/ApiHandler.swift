//
//  ApiHandler.swift
//  ChinkalDemo
//
//  Created by chinkalshah on 03/08/19.
//  Copyright © 2019 chinkalshah. All rights reserved.
//

import UIKit

class ApiHandler: NSObject {
    
    enum requestType: UInt {
        case getWeatherForecastData
    }
    
    // MARK: - downloadWeather Api
    public class func downloadWeatherForecast(_ requestType : UInt , httpmethod : String , lat : String , long : String , Delegate : DataDownloadCompletionDelegate)  {
        let stringToAppend = API.BaseURL + String(format: "%@%@%@%@", "&lat=",lat,"&lon=",long)
        URLSession.shared.dataTask(with: URL(string: stringToAppend)!) { (data, response, error) -> Void in
                Delegate.dataDownloadCompleted(error: error, data: data!)
            }.resume()
    }
}
