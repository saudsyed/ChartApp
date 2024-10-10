//
//  WeeklySaleChartView.swift
//  ChartsApp
//
//  Created by Saud Syed on 08/10/2024.
//

import SwiftUI
import Charts

struct WeeklySaleChartView: View {
    
    @ObservedObject var viewModel: SalesViewModel
    @State private var rawSelectedDate: Date? = nil
    
    @Environment(\.calendar) var calendar
    
    var selectedDateValue: SelectedDateValue? {
        if let rawSelectedDate {
            
            return viewModel.salesByWeek.first(where: {
                let startOfWeek = $0.day
                let endOfWeek = endOfWeek(for: startOfWeek) ?? Date()
                return (startOfWeek ... endOfWeek).contains(rawSelectedDate)
            })
        }
        
        return nil
    }
    
    var body: some View {
        Chart(viewModel.salesByWeek, id: \.day) {
            BarMark(x: .value("Week", $0.day, unit: .weekOfYear),
                    y: .value("Qunatity", $0.sales))
            .opacity(selectedDateValue == nil || $0.day == selectedDateValue?.day ? 1 : 0.5)
            
            if let rawSelectedDate {
                RuleMark(x: .value("Selected",
                                   rawSelectedDate,
                                   unit: .day))
                .foregroundStyle(Color.gray.opacity(0.03))
                .zIndex(-1)
                .annotation(position: .top,
                            spacing: 0,
                            overflowResolution: .init(x: .fit(to: .chart),
                                                      y: .disabled)) {
                    SelectionPopoverView(selectedDateValue: selectedDateValue)
                }
            }
        }
        .chartXSelection(value: $rawSelectedDate)
        
    }
    
    //MARK: - endOfWeek()
    private func endOfWeek(for startOfWeek: Date) -> Date? {
        calendar.date(byAdding: .day, value: 6, to: startOfWeek)
    }
}

#Preview {
    WeeklySaleChartView(viewModel: .preview)
        .aspectRatio(1, contentMode: .fit)
        .padding()
}
