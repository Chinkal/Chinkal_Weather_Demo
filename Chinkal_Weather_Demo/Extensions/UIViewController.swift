//
//  UIViewController.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 12/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//
import Foundation
import UIKit

extension UIViewController {

    func showAlertWith(title: String, message: String){
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        alertController.addAction(UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil))
        present(alertController, animated: true, completion: nil)

    }

}
