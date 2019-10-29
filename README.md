![Swift 5.1](https://img.shields.io/badge/Swift-5.1-orange.svg?style=flat)
![Platforms: Linux, macOS, iOS](https://img.shields.io/badge/Platforms-Linux%20%7C%20macOS%20%7C%20iOS-lightgray.svg?style=flat)
[![Release](https://img.shields.io/github/v/release/123FLO321/NominatimSwift.svg?style=flat)](https://github.com/123FLO321/NominatimSwift/releases)
[![Build Status](https://travis-ci.com/123FLO321/NominatimSwift.svg?branch=master)](https://travis-ci.com/123FLO321/NominatimSwift)

# NominatimSwift
A Typesafe OSM Nominatim API Wrapper written in Swift.

## Features
- [/search](https://nominatim.org/release-docs/develop/api/Search/) [TODO]
- [/reverse](https://nominatim.org/release-docs/develop/api/Reverse/)
- [/lookup](https://nominatim.org/release-docs/develop/api/Lookup/) [TODO]

## Getting Started
### Initialize the Wrapper
Default arguments:
```SWIFT
let nominatim = Nominatim()
```
Optianally you can specify a custom Nominatim URL and/or disable caching:
```SWIFT
let nominatim = Nominatim(nominatimURL: URL(string: "https://nominatim.example.com")!, enableCache: false)
```

### Reverse Geolocation lookup
Async lookup by location with all params:
```SWIFT
nominatim.reverse(
  params: ReverseParams(
    query: .coordinate(latitude: 47.263208, longitude: 11.400494),
    addressdetails: true,
    extratags: false,
    namedetails: false,
    acceptLanguage: "de",
    zoom: 15
  )
) { (result, error) in 
    print(result.name, result.address.road, result.address.houseNumber) // Hauptbahnhof Südtiroler Platz 5 
}
```
Sync lookup by location with minimum params:
```SWIFT
let result = try nominatim.reverse(
  params: ReverseParams(
    query: .coordinate(latitude: 47.263208, longitude: 11.400494)
  )
)
print(result.name, result.address.road, result.address.houseNumber) // Hauptbahnhof Südtiroler Platz 5 
```
Sync lookup by osm id with minimum params:
```SWIFT
let result = try nominatim.reverse(
  params: ReverseParams(
    query: .model(osmType: .way, osmID: "25757253")
  )
)
print(result.name, result.address.road, result.address.houseNumber) // Hauptbahnhof Südtiroler Platz 5 
```
