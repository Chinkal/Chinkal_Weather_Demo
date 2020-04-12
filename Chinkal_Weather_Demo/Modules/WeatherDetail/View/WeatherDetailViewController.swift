//
//  WeatherDetailViewController.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 10/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    // MARK: - Properties -

    @IBOutlet weak var weatherCollectionView: UICollectionView!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblPressure: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblWind: UILabel!

    @IBOutlet weak var imaWeather: UIImageView!

    static private let weatherCollectionIdentifier =  String(describing: WeatherCollectionViewCell.self)
    var presenter: WeatherDetailPresenter!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
}

// MARK: - Setup views
extension WeatherDetailViewController: WeatherViewInterface {
    func setViewDetails(_ item: WeatherItemInterface) {
        self.navigationItem.title = item.city
        self.lblTemp.text = String(format: "%.0f °C", item.temp! - 273.15)
        self.imaWeather.image = UIImage(named: item.icon!)
        
        self.lblPressure.text = String(format: "%.f hPa", item.pressure!)
        self.lblHumidity.text = String(format: "%.f", item.humidity!) + "%"
        self.lblWind.text = String(format: "%.f m/s", item.wind!)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.weatherCollectionView.reloadData()
        }
    }

}

//MARK: -  CollectionView Datasource
extension WeatherDetailViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOrItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherDetailViewController.weatherCollectionIdentifier, for: indexPath) as! WeatherCollectionViewCell
        let item = presenter.item(at: indexPath)
        cell.configure(with: item)
        return cell
    }
    
}


//MARK: -  CollectionView Layout
extension WeatherDetailViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.weatherCollectionViewBounds.width, height:Constants.weatherCollectionViewBounds.height)

    }
    

}




