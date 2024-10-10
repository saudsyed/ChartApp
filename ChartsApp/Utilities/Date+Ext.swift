//
//  Date+Ext.swift
//  ChartsApp
//
//  Created by Saud Syed on 08/10/2024.
//

import Foundation

extension Date {
    //MARK: - Random Date Generator Function
    static func randomDate(in range: ClosedRange<Date>) -> Date {
        let diff = range.upperBound.timeIntervalSinceReferenceDate - range.lowerBound.timeIntervalSinceReferenceDate
        let randomValue = diff * Double.random(in: 0...1) + range.lowerBound.timeIntervalSinceReferenceDate
        return Date(timeIntervalSinceReferenceDate: randomValue)
    }
}
