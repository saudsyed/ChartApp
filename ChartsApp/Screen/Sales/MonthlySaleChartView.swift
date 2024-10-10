//
//  MonthlySaleChartView.swift
//  ChartsApp
//
//  Created by Saud Syed on 08/10/2024.
//

import SwiftUI
import Charts

struct MonthlySaleChartView: View {
    
    @ObservedObject var viewModel: SalesViewModel
    
    var body: some View {
        Chart(viewModel.salesData) {
            BarMark(x: .value("Month", $0.saleDate, unit: .month),
                    y: .value("Sales", $0.quantity))
            .foregroundStyle(.blue)
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .month)) { _ in
                AxisGridLine()
                AxisTick()
                AxisValueLabel(format: .dateTime.month(.abbreviated), centered: true)
            }
        }
    }
}

#Preview {
    MonthlySaleChartView(viewModel: .preview)
        .aspectRatio(1, contentMode: .fit)
        .padding()
}
