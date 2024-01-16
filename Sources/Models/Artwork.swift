//
//  Artwork.swift
//  Muzei
//
//  Created by Armin on 1/16/24.
//

import Foundation

public typealias Artworks = [Artwork]

public struct Artwork: Codable {
    public init(
        byline: String,
        title: String,
        color: String,
        detailsURL: String,
        publishDate: String,
        thumbURL: String
    ) {
        self.byline = byline
        self.title = title
        self.color = color
        self.detailsURL = detailsURL
        self.publishDate = publishDate
        self.thumbURL = thumbURL
    }
    
    public let byline: String
    public let title: String
    public let color: String
    public let detailsURL: String
    public let publishDate: String
    public let thumbURL: String

    enum CodingKeys: String, CodingKey {
        case byline = "byline"
        case title = "title"
        case color = "color"
        case detailsURL = "details_url"
        case publishDate = "publish_date"
        case thumbURL = "thumb_url"
    }
}
