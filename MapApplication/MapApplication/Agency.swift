//
//  Agency.swift
//  MapApplication
//
//  Created by Anthony Barillot on 10/04/2017.
//  Copyright © 2017 Anthony Barillot. All rights reserved.
//

class Agency {
    
    // Properties
    private var _address: String
    private var _latitude: Double
    private var _longitude: Double
    private let _name: String
    
    // Constructor
    required init(address: String, latitude: Double, longitude: Double, name: String) {
        self._address = address
        self._name = name
        self._latitude = latitude
        self._longitude = longitude
    }
    
    // Getter & setter
    var address: String {
        get {
            return _address
        } set {
            _address = newValue
        }
    }
    
    var latitude: Double {
        get {
            return _latitude
        } set {
            _latitude = newValue
        }
    }
    
    var longitude: Double {
        get {
            return _longitude
        } set {
            _longitude = newValue
        }
    }
    
    var name: String {
        get {
            return _name
        }
    }
    
    // Methods
    func display() -> String {
        return "Agency: " + _name + " - " + _address + " [lat.:" + String(_latitude) + ", long.:" + String(_longitude) + "]"
    }
    
    func location() -> String {
        return "latitude " + String(format: "%.3f", _latitude) + ", longitude " + String(format: "%.3f", _longitude)
    }
}
