//
//  CityPresenter.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 11/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

class CityPresenter  {

    private unowned var _view: CityViewInterface
    private var _interactor: CityInteractorInterface
    private var _wireframe: CityPresenterToRouterProtocol
    
    private var _weatherDetails: [MyWeather] = [] {
        didSet {
            _view.reloadData()
        }
    }

    // MARK - Lifecycle
    init(wireframe: CityPresenterToRouterProtocol, view: CityViewInterface, interactor: CityInteractorInterface) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }

}

// MARK: - CityPresenterDelegate
extension CityPresenter: CityPresenterInterface , DataDownloadCompletionDelegate {
    
    @objc private func currenLocationChanged() {
        getCurrentCityWeather()
    }
    
    func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(currenLocationChanged), name: .currentLocationChanged, object: nil)
        LocationManager.shared.start()
        getCurrentCityWeather()
    }
    
    private func getCurrentCityWeather(){
        self._view.setLoadingVisible(true)
        
        #if targetEnvironment(simulator)
            let currenLocation = LocationManager.shared.simulatedLocation()
        #else
        guard let currenLocation = LocationManager.shared.currentLocation else {
            self._view.setLoadingVisible(false)
            return
        }
        #endif
        let latitude = CGFloat(currenLocation.coordinate.latitude)
        let longitude = CGFloat(currenLocation.coordinate.longitude)
        
        if(Reachability.isConnectedToNetwork()){
            _interactor.downloadWeatherForecast(ApiHandler.requestType.getWeatherForecastData.rawValue, httpmethod: "GET", lat: String(format: "%.f", Double(latitude)), long: String(format: "%.f", Double(longitude)), Delegate: self)
        }else{
            self._view.setLoadingVisible(false)
            _view.showMessageWith(title: Constants.GenericAlert, message: Constants.NoInternet)
        }
    }
    
    func dataDownloadCompleted(error:Error? , data:Data){
        self._view.setLoadingVisible(false)
        if error == nil {
            do {
                let weatherDetails = try JSONDecoder().decode(MyWeather.self, from: data)
                _weatherDetails = [weatherDetails]
                _view.reloadData()
            } catch {
                // Something went wrong
            }
        }

    }
    
    func viewWillAppear(animated: Bool) {
        fatalError("Implementation pending...")
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func item(at indexPath: IndexPath) -> CityItemInterface {
        return _weatherDetails[indexPath.row]
    }

    func numberOrItems(in section: Int) -> Int {
        return _weatherDetails.count
    }

    func didSelectItem(at indexPath: IndexPath , navigationController : UINavigationController) {
        let weather = _weatherDetails[indexPath.row]
        _wireframe.pushToDetailScreen(navigationConroller: navigationController, weather: weather)
    }
}

