//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Sydney Rossman-Reich on 5/31/16.
//  Copyright © 2016 Sydney Rossman-Reich. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    func mapTypeChanged( segControl: UISegmentedControl){ switch segControl.selectedSegmentIndex {
    case 0: mapView.mapType = .Standard
    case 1: mapView.mapType = .Hybrid
    case 2: mapView.mapType = .Satellite
    default: break }
    }
    
    override func loadView() {
        
        mapView = MKMapView()
        
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard","Hybrid","Satellite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget( self, action: #selector(self.mapTypeChanged), forControlEvents: .ValueChanged)
        
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
       
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
