//
//  MuzeiEndpoint.swift
//  Muzei
//
//  Created by Armin on 1/16/24.
//

import Foundation

enum MuzeiEndpoint {
    case featured
    case archive(date: ArchiveDate)
}

extension MuzeiEndpoint: Endpoint {
    
    var baseURL: String {
        switch self {
        case .featured:
            "https://muzei.co"
        case .archive:
            "https://storage.googleapis.com"
        }
    }
    
    var path: String {
        switch self {
        case .featured:
            return "/featured"
        case .archive(let date):
            return "/muzeifeaturedart/archivemeta/\(date.value).txt"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
}
