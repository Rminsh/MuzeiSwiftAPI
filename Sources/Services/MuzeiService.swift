//
//  MuzeiService.swift
//  Muzei
//
//  Created by Armin on 1/16/24.
//

import Foundation

protocol MuzeiServiceable {
    func getFeatured() async throws -> FeaturedArtwork
    func getArchive(date: ArchiveDate) async throws -> Artworks
}

public struct MuzeiService: HTTPClient, MuzeiServiceable {
    public init() {}
    
    public func getFeatured() async throws -> FeaturedArtwork {
        return try await sendRequest(
            endpoint: MuzeiEndpoint.featured,
            responseModel: FeaturedArtwork.self
        )
    }
    
    public func getArchive(date: ArchiveDate) async throws -> Artworks {
        return try await sendRequest(
            endpoint: MuzeiEndpoint.archive(date: date),
            responseModel: Artworks.self,
            shouldSeparate: true
        )
    }
}
