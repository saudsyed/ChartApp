//
//  DailySaleChartView.swift
//  ChartsApp
//
//  Created by Saud Syed on 08/10/2024.
//

import SwiftUI
import Charts

struct DailySaleChartView: View {
    
    @State private var scrollPosition: TimeInterval = TimeInterval()
    
    let salesData: [Sale]
    private let numberOfDisplayedDays = 30
    
    private var scrollPositionStart: Date {
        Date(timeIntervalSinceReferenceDate: scrollPosition)
    }
    
    private var scrollPositionEnd: Date {
        scrollPositionStart.addingTimeInterval(3600 * 24 * 30)
    }
    
    private var scrollPositionString: String {
        scrollPositionStart.formatted(.dateTime.month().day())
    }
    
    private var scrollPositionEndString: String {
        scrollPositionEnd.formatted(.dateTime.month().day().year())
    }
    
    init(salesData: [Sale]) {
        self.salesData = salesData
        
        guard let lastDate = salesData.last?.saleDate else { return }
        let beginingOfInterval = lastDate.addingTimeInterval(-1 * 3600 * 24 * 30)
        
        self._scrollPosition = State(initialValue: beginingOfInterval.timeIntervalSinceReferenceDate)
        
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            
            Text("\(scrollPositionString) - \(scrollPositionEndString)")
                .font(.callout)
                .foregroundStyle(.secondary)
            
            Chart(salesData, id: \.saleDate) {
                BarMark(x: .value("Day", $0.saleDate, unit: .day),
                        y: .value("Qunatity", $0.quantity))
            }
            .chartScrollableAxes(.horizontal)
            .chartXVisibleDomain(length: 3600 * 24 * numberOfDisplayedDays) // shows 30 days
            // snap to begining of month when release scrolling
            .chartScrollTargetBehavior(
                .valueAligned(
                    matching: .init(hour: 0),
                    majorAlignment: .matching(.init(day: 1))))
            .chartScrollPosition(x: $scrollPosition)
        }
    }
}

#Preview {
    DailySaleChartView(salesData: SalesViewModel.preview.salesData)
        .aspectRatio(1, contentMode: .fit)
        .padding()
}
