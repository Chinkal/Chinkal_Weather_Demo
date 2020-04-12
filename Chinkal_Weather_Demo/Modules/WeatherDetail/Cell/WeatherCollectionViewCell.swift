//
//  WeatherCollectionViewCell.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 10/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!

    func configure(with item: WeatherItemInterfaceForCollection) {
        self.lblDay.text = self.lblDay.text!.convertTimeStampToCurrentday(timestamp: TimeInterval(item.date!))
        self.lblTime.text = self.lblTime.text!.convertTimeStampToCurrentTime(timestamp: TimeInterval(item.date!))
        self.lblTemp.text = String(format: "%.0f °C", item.dayTempareture! - 273.15)
        self.imgWeather.image = UIImage(named: item.iconOfEachDay!)
    }
}
