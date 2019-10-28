//
//  ReverseParams.swift
//  NominatimSwift
//
//  Created by Florian Kostenzer on 27.10.19.
//

import Foundation

public struct ReverseParams: Hashable {

    public enum Query: Hashable {
        case coordinate(latitude: Double, longitude: Double)
        case model(osmType: OSMType, osmID: String)
    }

    public enum OSMType: String {
        case node = "N", way = "W", relation = "R"
    }

    public init(query: ReverseParams.Query, addressdetails: Bool?=nil, extratags: Bool?=nil,
                  namedetails: Bool?=nil, acceptLanguage: String?=nil, zoom: UInt8?=nil) {
        self.query = query
        self.addressdetails = addressdetails
        self.extratags = extratags
        self.namedetails = namedetails
        self.acceptLanguage = acceptLanguage
        self.zoom = zoom
    }

    public var query: Query
    public var addressdetails: Bool?
    public var extratags: Bool?
    public var namedetails: Bool?
    public var acceptLanguage: String?
    public var zoom: UInt8?

    public func toQueryParams() -> String {
        var string = ""
        switch query {
        case .coordinate(let lat, let lon):
            string += "lat=\(lat)&lon=\(lon)"
        case .model(let osmType, let osmID):
            string += "osm_type=\(osmType.rawValue)&osm_id=\(osmID)"
        }
        if let addressdetails = addressdetails {
            string += "&addressdetails=\(addressdetails ? 0 : 1)"
        }
        if let extratags = extratags {
            string += "&extratags=\(extratags ? 0 : 1)"
        }
        if let namedetails = namedetails {
            string += "&namedetails=\(namedetails ? 0 : 1)"
        }
        if let acceptLanguage = acceptLanguage {
            string += "&accept-language=\(acceptLanguage)"
        }
        if let zoom = zoom {
            string += "&zoom=\(zoom)"
        }
        return string
    }

}
