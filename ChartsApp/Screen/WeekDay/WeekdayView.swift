//
//  WeekdayView.swift
//  ChartsApp
//
//  Created by Saud Syed on 09/10/2024.
//

import SwiftUI
import Charts

struct WeekdayView: View {
    
    @ObservedObject var viewModel: SalesViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            if let highestSellingWeekday = viewModel.highestSellingWeekday {
                Text("You highest selling weekday is ") +
                Text("\(viewModel.longWeekday(for: highestSellingWeekday.number)) ").bold().foregroundStyle(.blue) +
                Text("with an average of ") +
                Text("\(Int(highestSellingWeekday.sales)) sales per day").bold()
            }
            
            Chart(viewModel.averageSalesByWeekday, id: \.number) {
                BarMark(x: .value("Weekday", viewModel.weekday(for: $0.number)),
                        y: .value("Sales", $0.sales))
                .opacity($0.number == viewModel.highestSellingWeekday?.number ? 1 : 0.4)
                .foregroundStyle(Color.blue.gradient)
            }
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .frame(height: 50)
        }
    }
}

#Preview {
    WeekdayView(viewModel: .preview)
        .padding()
}
