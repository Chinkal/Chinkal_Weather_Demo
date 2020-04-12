//
//  CityInterfaces.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 11/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

protocol CityPresenterToRouterProtocol: class {
    func pushToDetailScreen(navigationConroller:UINavigationController , weather : MyWeather)
}

protocol CityViewInterface: class {
    func reloadData()
    func setLoadingVisible(_ visible: Bool)
    func showMessageWith(title: String, message: String)

}

protocol CityPresenterInterface: class {
    func viewDidLoad()
    func viewWillAppear(animated: Bool)
    func numberOfSections() -> Int
    func didSelectItem(at indexPath: IndexPath , navigationController : UINavigationController) 

}

protocol CityInteractorInterface: class {
    func downloadWeatherForecast(_ requestType : UInt , httpmethod : String , lat : String , long : String , Delegate : DataDownloadCompletionDelegate)
}

protocol CityItemInterface {
    var cityName: String? { get }
    var temp: Double? { get }
    var icon: String? { get }
}




