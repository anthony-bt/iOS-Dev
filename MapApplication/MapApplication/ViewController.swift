//
//  ViewController.swift
//  MapApplication
//
//  Created by Anthony Barillot on 06/04/2017.
//  Copyright © 2017 Anthony Barillot. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    var data = [Agency]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // SearchBar init
        searchBar.placeholder = "Recherchez une agence de voyage..."
        
        // TableView init
        tableView.dataSource = self
        tableView.delegate = self
        populateData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.endEditing(true)
    }
    
    func populateData() {
        let path = Bundle.main.path(forResource: "data_travel_agencies", ofType: "csv")
        
        do {
            let contents = try String(contentsOfFile: path!)
            let lines = contents.components(separatedBy: "\n")
            for line in lines.dropFirst() {
                let columns = line.components(separatedBy: ";")
                
                let address = columns[7]
                let name = columns[3]
                let latitude = Double(columns[14])!
                let longitude = Double(columns[15])!
                
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                annotation.title = name
                mapView.addAnnotation(annotation)
                
                let agency = Agency(address: address, latitude: latitude, longitude: longitude, name: name)
                data.append(agency)
            }
        } catch {
            print("Error")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let currentCell = tableView.cellForRow(at: indexPath)!
        //print(currentCell.textLabel?.text! as Any)
        //print(currentCell.reuseIdentifier as Any)
        
        let selectedRow: Agency = data[indexPath.item]
        let location = CLLocationCoordinate2D(latitude: selectedRow.latitude, longitude: selectedRow.longitude)
        
        mapView.setCenter(location, animated: true)
        print(selectedRow.display())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let agency: Agency = data[indexPath.item]
        let cell: UITableViewCell = UITableViewCell (style: UITableViewCellStyle.subtitle, reuseIdentifier: agency.name)
        
        cell.imageView?.image = UIImage(named: "ListIcon")
        cell.textLabel?.text = agency.name
        cell.detailTextLabel?.text = agency.address
        
        return cell
    }

}
