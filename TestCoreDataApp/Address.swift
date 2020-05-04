//
//  Address.swift
//  TestCoreDataApp
//
//  Created by user167484 on 4/17/20.
//  Copyright © 2020 Allen Savio. All rights reserved.
//

import Foundation
import CoreLocation

class Addresss: Codable {
    var name = ""
    var locality = ""
    var county = ""
    var state = ""
    var country = ""
    var postalcode = ""
    
    
    init(mark: CLPlacemark) {
        name = mark.name ?? ""
        locality = mark.locality ?? ""
        county = mark.subAdministrativeArea ?? ""
        state = mark.administrativeArea ?? ""
        country = mark.country ?? ""
        postalcode = mark.postalCode ?? ""
    }
    
}

extension Addresss: CustomStringConvertible {
    var description: String {
        var countryInfo = "\(county), \(state), \(country), \(postalcode)"
        
        return "\(name), \(locality), \(countryInfo)"
    }
}
