//
//  SaleView.swift
//  ChartsApp
//
//  Created by Saud Syed on 08/10/2024.
//

import SwiftUI
import Charts

struct SaleView: View {
    
    @ObservedObject var viewModel: SalesViewModel
    
    private var percentage: Double {
        Double(viewModel.totalSales) / Double(viewModel.lastTotalSales) - 1
    }
    
    private var isPositiveChange: Bool {
        percentage > 0
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let changeBookSale = viewModel.changedBookSales(percentage: percentage) {
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: isPositiveChange ? "arrow.up.right" : "arrow.down.right").bold()
                        .foregroundColor( isPositiveChange ? .green : .red)
                    
                    Text("You book sales ") +
                    Text(changeBookSale)
                        .bold() +
                    Text(" in the last 90 days.")
                }
            }
            
            Chart(viewModel.salesByWeek, id: \.day) {
                BarMark(x: .value("Week", $0.day, unit: .weekOfYear),
                        y: .value("Sales", $0.sales))
            }
            .frame(height: 70)
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
        }
    }
}

#Preview {
    SaleView(viewModel: .preview)
        .padding()
}
