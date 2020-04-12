//
//  CityRouter.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 11/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

class CityRouter : CityPresenterToRouterProtocol{
    
    // MARK: - Module setup -

    static func createModule() -> CityViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "CityViewController") as! CityViewController

        let router:CityPresenterToRouterProtocol = CityRouter()
        let interactor = CityInterector()
        let presenter = CityPresenter(wireframe: router, view: view, interactor: interactor)
        view.presenter = presenter

        return view
    }

    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToDetailScreen(navigationConroller:UINavigationController , weather : MyWeather)
    {
        let movieModue = WeatherDetailRouter.createDetailModule(weather: weather)
        navigationConroller.pushViewController(movieModue, animated: true)
    }


}
