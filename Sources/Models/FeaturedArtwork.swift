//
//  FeaturedArtwork.swift
//  Muzei
//
//  Created by Armin on 1/16/24.
//

import Foundation

public struct FeaturedArtwork: Codable {
    public init(
        attribution: String,
        byline: String,
        detailsURL: String,
        imageURL: String,
        nextTime: String,
        thumbURL: String,
        title: String
    ) {
        self.attribution = attribution
        self.byline = byline
        self.detailsURL = detailsURL
        self.imageURL = imageURL
        self.nextTime = nextTime
        self.thumbURL = thumbURL
        self.title = title
    }
    
    public let attribution: String
    public let byline: String
    public let detailsURL: String
    public let imageURL: String
    public let nextTime: String
    public let thumbURL: String
    public let title: String

    enum CodingKeys: String, CodingKey {
        case attribution = "attribution"
        case byline = "byline"
        case detailsURL = "detailsUri"
        case imageURL = "imageUri"
        case nextTime = "nextTime"
        case thumbURL = "thumbUri"
        case title = "title"
    }
}
