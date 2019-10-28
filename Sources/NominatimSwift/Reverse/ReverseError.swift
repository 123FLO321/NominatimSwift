//
//  ReverseError.swift
//  NominatimSwift
//
//  Created by Florian Kostenzer on 27.10.19.
//

import Foundation

public enum ReverseError {
    case requestError(error: Error?)
    case parsingError(error: Error?)
}
