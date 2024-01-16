//
//  ArchiveDate.swift
//  Muzei
//
//  Created by Armin on 1/16/24.
//

import Foundation

public enum ArchiveDate {
    case today
    case custom(date: Date)
    
    var value: String {
        
        let format: Date.FormatStyle = .dateTime.locale(Locale(identifier: "en_US"))
        
        switch self {
        case .today:
            let date: Date = .now
            let day = date.formatted(format.day())
            let month = date.formatted(format.month(.twoDigits))
            let year = date.formatted(format.year())
            return year + month + day
            
        case .custom(let date):
            let month = date.formatted(format.month(.twoDigits))
            let year = date.formatted(format.year())
            return year + month
        }
    }
}
