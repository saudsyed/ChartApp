//
//  Enumeration.swift
//  ChartsApp
//
//  Created by Saud Syed on 08/10/2024.
//

import Foundation

enum TimeIntervalEnum: String, CaseIterable, Identifiable {
    case day = "Day"
    case week = "Week"
    case month = "Month"
    var id: Self { self }
}

enum ChartStyle: String, CaseIterable, Identifiable {
    case pie = "Pie Chart"
    case bar = "Bar Chart"
    case singleBar = "Single Bar"
    var id: Self { self }
}
