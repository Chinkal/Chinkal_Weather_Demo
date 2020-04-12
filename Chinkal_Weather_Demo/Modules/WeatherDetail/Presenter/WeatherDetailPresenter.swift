//
//  WeatherDetailPresenter.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 11/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

class WeatherDetailPresenter: NSObject {

    // MARK: - Properties -
    
    private unowned var _view: WeatherViewInterface
    private var _interactor: WeatherInteractorInterface
    private var _wireframe: WeatherPresenterToRouterProtocol
    private let _weatherDetails: MyWeather
    
    var arrayComingDaysWeather: [daily] = []

    // MARK: - Lifecycle -

    init(wireframe: WeatherPresenterToRouterProtocol, view: WeatherViewInterface, interactor: WeatherInteractorInterface ,weatherDetails: MyWeather) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
        _weatherDetails = weatherDetails
    }

}

// MARK: - Extensions -

extension WeatherDetailPresenter: WeatherPresenterInterface {
   
    func viewDidLoad() {
        _view.setViewDetails(_weatherDetails)
        arrayComingDaysWeather = _weatherDetails.daily
        _view.reloadData()
    }
    
    func viewWillAppear(animated: Bool) {
        fatalError("Implementation pending...")
    }

    func numberOfSections() -> Int {
        return 1
    }
    
    func item(at indexPath: IndexPath) -> WeatherItemInterfaceForCollection {
        return arrayComingDaysWeather[indexPath.row]
    }

    func numberOrItems(in section: Int) -> Int {
        return arrayComingDaysWeather.count
    }

}
