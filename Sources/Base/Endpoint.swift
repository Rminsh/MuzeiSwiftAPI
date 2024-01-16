//
//  Endpoint.swift
//  Muzei
//
//  Created by Armin on 1/16/24.
//

import Foundation

protocol Endpoint {
    var baseURL:    String     { get }
    var path:       String     { get }
    var method:     HTTPMethod { get }
}
