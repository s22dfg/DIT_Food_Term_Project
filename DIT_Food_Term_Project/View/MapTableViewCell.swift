//
//  MapTableViewCell.swift
//  DIT_Food_Term_Project
//
//  Created by D7703_22 on 2018. 6. 29..
//  Copyright © 2018년 s22dfg. All rights reserved.
//

import UIKit
import MapKit

class MapTableViewCell: UITableViewCell {
    
    @IBOutlet weak var map: MKMapView!
    
    func configure(location: String) {
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(location, completionHandler: {
            
            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
            
            if let error = error {
                print(error)
                return
            }
            
            if placemarks != nil {
                let placemark = placemarks![0]
                
                // Add annotation
                let annotation = MKPointAnnotation()
                //annotation.title = self.name
                //annotation.subtitle = self.type
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    self.map.addAnnotation(annotation)
                    
                    // Set zoom level
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
                    self.map.setRegion(region, animated: true)
                }
            }
            
        })
    
        func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

        func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
}
