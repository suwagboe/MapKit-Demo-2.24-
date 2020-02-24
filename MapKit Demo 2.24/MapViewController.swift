//
//  ViewController.swift
//  MapKit Demo 2.24
//
//  Created by Pursuit on 2/24/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    

    @IBOutlet weak var textField: UITextField!
    
    private let locationSession = CoreLocationSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
           // lets attempt to show the user's location
        mapView.showsUserLocation = true
        
        textField.delegate = self

    }
    
    private func convertPlaceNameToCoordinate(_ placeName: String){
        locationSession.convertPlaceNameToCoordinate(addressString: placeName) { (result) in
            switch result {
            case .failure(let error):
                print("geocoding error: \(error)")
            case .success(let coordinate):
                print("coordinate: \(coordinate)")
            }
            
        }
    }

}


extension MapViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // searchText is also the place name
        guard let searchText = textField.text, !searchText.isEmpty else {
            
            return true
        }
        
        return true
        
    }
}
