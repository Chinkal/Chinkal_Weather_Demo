//
//  WeatherDetailRouter.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 11/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

class WeatherDetailRouter: WeatherPresenterToRouterProtocol {
   
    // MARK: - Module setup -

    static func createDetailModule(weather : MyWeather) -> WeatherDetailViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "WeatherDetailViewController") as! WeatherDetailViewController

        let router:WeatherPresenterToRouterProtocol = WeatherDetailRouter()
        let interactor = WeatherDetailInterector()
        let presenter = WeatherDetailPresenter(wireframe: router, view: view, interactor: interactor, weatherDetails: weather)
        view.presenter = presenter

        return view
    }

    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }


}
