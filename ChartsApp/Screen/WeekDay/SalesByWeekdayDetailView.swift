//
//  SalesByWeekdayDetailView.swift
//  ChartsApp
//
//  Created by Saud Syed on 09/10/2024.
//

import SwiftUI
import Charts

struct SalesByWeekdayDetailView: View {
    
    @ObservedObject var viewModel: SalesViewModel
    
    @State private var individualDaysAreShown: Bool = false
    @State private var averageSalesIsShown: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            if let highestSellingWeekday = viewModel.highestSellingWeekday {
                Text("You highest selling weekday is ") +
                Text("\(viewModel.longWeekday(for: highestSellingWeekday.number)) ").bold().foregroundStyle(.blue) +
                Text("with an average of ") +
                Text("\(Int(highestSellingWeekday.sales)) sales per day").bold()
            }
            
            Chart {
                    ForEach(viewModel.averageSalesByWeekday, id: \.number) {
                    BarMark(x: .value("Day", viewModel.weekday(for: $0.number)),
                            y: .value("Sales", $0.sales))
                    .foregroundStyle(Color.gray.opacity(0.4))
                    
                    RectangleMark(x: .value("Day", viewModel.weekday(for: $0.number)),
                                  y: .value("Sales", $0.sales),
                                  height: 0)
                    .foregroundStyle(.gray)
                }
                
                if individualDaysAreShown {
                    ForEach(viewModel.salesByWeekday, id: \.number) { weekdayData in
                        ForEach(weekdayData.sales, id: \.id) { saleData in
                            PointMark(x: .value("Day", viewModel.weekday(for: weekdayData.number)),
                                    y: .value("Sale", saleData.quantity))
                            .foregroundStyle(Color.indigo.opacity(0.3))
                        }
                    }
                }
                
                if averageSalesIsShown {
                    let average = viewModel.averageSales
                    RuleMark(y: .value("Average", average))
                        .foregroundStyle(.blue)
                        .lineStyle(StrokeStyle(lineWidth: 3))
                        .annotation(position: .top, alignment: .trailing, spacing: 0) {
                            Text("Average: \(String(format: "%.2f", average))")
                                .font(.body.bold())
                                .foregroundStyle(.blue)
                        }
                }
            }
            .aspectRatio(1, contentMode: .fit)
            Toggle("Show all daily sales", isOn: $individualDaysAreShown.animation())
            Toggle("Show average of daily sales", isOn: $averageSalesIsShown.animation())
            Spacer()
        }
        .padding()
    }
}

#Preview {
    SalesByWeekdayDetailView(viewModel: .preview)
}
