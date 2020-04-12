//
//  CityCollectionViewCell.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 10/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblCityName: UILabel!
    @IBOutlet weak var lblCityTemp: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!

    func configure(with item: CityItemInterface) {
        self.lblCityName.text = item.cityName
        self.lblCityTemp.text = String(format: "%.0f °C", item.temp! - 273.15)
        self.imgWeather.image = UIImage(named: item.icon!)
    }
}
