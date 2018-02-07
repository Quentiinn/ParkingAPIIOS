//
//  URL+Helpers.swift
//  ProjetParking
//
//  Created by  on 24/01/2018.
//  Copyright © 2018 com.iut-bm.univ. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
