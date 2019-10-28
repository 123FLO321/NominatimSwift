//
//  File.swift
//  
//
//  Created by Florian Kostenzer on 28.10.19.
//

import Foundation

public struct Address: Decodable {
    public var houseNumber: String?
    public var road: String?
    public var suburb: String?
    public var cityDistrict: String?
    public var city: String?
    public var county: String?
    public var state: String?
    public var region: String?
    public var postcode: String?
    public var country: String?
    public var countryCode: String?

    enum CodingKeys: String, CodingKey {
        case houseNumber = "house_number", road, suburb, cityDistrict = "city_district"
        case city, county, state, region, postcode, country, countryCode = "country_code"
    }
}
