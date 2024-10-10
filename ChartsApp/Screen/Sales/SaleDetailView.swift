//
//  SaleDetailView.swift
//  ChartsApp
//
//  Created by Saud Syed on 08/10/2024.
//

import SwiftUI

struct SaleDetailView: View {
    
    @ObservedObject var viewModel: SalesViewModel
    @State private var selectedTimeInterval = TimeIntervalEnum.day
    
    var body: some View {
        VStack {
            /// Picker View
            Picker(selection: $selectedTimeInterval.animation()) {
                ForEach(TimeIntervalEnum.allCases) { interval in
                    Text(interval.rawValue)
                }
            } label: {
                Text("Time interval")
            }
            .pickerStyle(.segmented)
            
            /// Text Headline
            Group {
                Text("You sold ") +
                Text("\(viewModel.totalSales) books").bold().foregroundStyle(Color.accentColor) +
                Text(" in the last 90 days")
            }
            .padding(.vertical)
            
            ///Chart View
            Group {
                switch selectedTimeInterval {
                case .day:
                    DailySaleChartView(salesData: viewModel.salesData)
                case .week:
                    WeeklySaleChartView(viewModel: viewModel)
                case .month:
                    MonthlySaleChartView(viewModel: viewModel)
                }
            }
            .aspectRatio(0.8, contentMode: .fit)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SaleDetailView(viewModel: .preview)
}
