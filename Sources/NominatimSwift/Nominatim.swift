//
//  Nominatim.swift
//  NominatimSwift
//
//  Created by Florian Kostenzer on 27.10.19.
//

import Foundation
import Logging

#if os(Linux)
import FoundationNetworking
#endif

public class Nominatim {

    private let nominatimURL: URL
    private let enableCache: Bool

    private let reverseCacheLock = NSLock()
    private var reverseCache = [ReverseParams: ReverseResult]()

    private let logger = Logger(label: "com.github.123flo321.nominatimswift.nominatim")

    public init(nominatimURL: URL=URL(string: "https://nominatim.openstreetmap.org")!, enableCache: Bool=true) {
        self.nominatimURL = nominatimURL
        self.enableCache = enableCache
    }

    public func reverse(params: ReverseParams, completion: @escaping (ReverseResult?, ReverseError?) -> Void) {
        if enableCache {
            reverseCacheLock.lock()
            let cached = reverseCache[params]
            reverseCacheLock.unlock()
            if let cached = cached {
                return completion(cached, nil)
            }
        }

        request(path: "/reverse?format=jsonv2&\(params.toQueryParams())") { (data, error) in
            guard let data = data else {
                return completion(nil, ReverseError.parsingError(error: error))
            }
            do {
                let result = try JSONDecoder().decode(ReverseResult.self, from: data)
                if self.enableCache {
                    self.reverseCacheLock.lock()
                    self.reverseCache[params] = result
                    self.reverseCacheLock.unlock()
                }
                return completion(result, nil)
            } catch {
                return completion(nil, ReverseError.requestError(error: error))
            }
        }
    }

    private func request(path: String, completion: @escaping (Data?, Error?) -> Void) {
        let url = URL(string: path, relativeTo: nominatimURL)!
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            completion(data, error)
        }
        task.resume()
    }

}
