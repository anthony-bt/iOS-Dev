//
//  ViewController.swift
//  MapApplication
//
//  Created by Anthony Barillot on 06/04/2017.
//  Copyright © 2017 Anthony Barillot. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // Do any additional setup after loading the view, typically from a nib.
        let location = CLLocationCoordinate2D(latitude:-34.61901432360716, longitude:-58.36553866285552)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Drake SRL"
        map.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
