//
//  CityViewController.swift
//  Chinkal_Weather_Demo
//
//  Created by chinkalshah on 10/04/20.
//  Copyright © 2020 chinkalshah. All rights reserved.
//

import UIKit

class CityViewController : UIViewController{
    
    // MARK: - Properties -

    @IBOutlet weak var cityCollectionView: UICollectionView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    static private let cityCellIdentifier =  String(describing: CityCollectionViewCell.self)
    var presenter: CityPresenter!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.lightText
        presenter.viewDidLoad()
    }
}

// MARK: - Setup views
extension CityViewController: CityViewInterface {
    
    func showMessageWith(title: String, message: String) {
        self.showAlertWith(title: title, message: message)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.cityCollectionView.reloadData()
        }
    }
    
    func setLoadingVisible(_ visible: Bool) {
        DispatchQueue.main.async {
            if visible {
                self.activityIndicator.startAnimating()
            } else {
                self.activityIndicator.stopAnimating()
            }
        }

    }
}

//MARK: -  CollectionView Datasource
extension CityViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOrItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityViewController.cityCellIdentifier, for: indexPath) as! CityCollectionViewCell
        let item = presenter.item(at: indexPath)
        cell.configure(with: item)
        return cell
    }
    
}

//MARK: -  CollectionView Delegate
extension CityViewController: UICollectionViewDelegate{
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath, navigationController: self.navigationController!)
    }
}


//MARK: -  CollectionView Layout
extension CityViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.cityCollectionViewBounds.width, height:Constants.cityCollectionViewBounds.height)
    }
}



