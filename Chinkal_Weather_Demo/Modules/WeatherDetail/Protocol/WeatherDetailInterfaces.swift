//
//  WeatherDetailInterfaces.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 11/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

protocol WeatherPresenterToRouterProtocol: class {

}

protocol WeatherViewInterface: class {
    func setViewDetails(_ item: WeatherItemInterface)
    func reloadData()
}


protocol WeatherPresenterInterface: class {
    func viewDidLoad()
    func viewWillAppear(animated: Bool)
    func numberOfSections() -> Int
    func item(at indexPath: IndexPath) -> WeatherItemInterfaceForCollection 
}

protocol WeatherInteractorInterface: class {
}

protocol WeatherItemInterface {
    var city: String? { get }
    var temp: Double? { get }
    var icon: String? { get }
    var pressure: Double? { get }
    var humidity: Double? { get }
    var wind: Double? { get }
}

protocol WeatherItemInterfaceForCollection {
    var date: Double? { get }
    var dayTempareture: Double? { get }
    var iconOfEachDay: String? { get }
}


