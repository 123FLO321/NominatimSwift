//
//  ReverseResult.swift
//  NominatimSwift
//
//  Created by Florian Kostenzer on 27.10.19.
//

import Foundation

public struct ReverseResult: Decodable {

    public var placeID: UInt64
    public var licence: String
    public var osmType: String
    public var osmID: UInt64
    public var latitude: String
    public var longitude: String
    public var placeRank: Double
    public var category: String
    public var type: String
    public var importance: Double
    public var addresstype: String
    public var name: String?
    public var displayName: String
    public var address: Address
    public var boundingbox: [String]

    enum CodingKeys: String, CodingKey {
        case placeID = "place_id", licence, osmType = "osm_type", osmID = "osm_id"
        case latitude = "lat", longitude = "lon", placeRank = "place_rank", category
        case type, importance, addresstype, name, displayName = "display_name"
        case address, boundingbox
    }
}
