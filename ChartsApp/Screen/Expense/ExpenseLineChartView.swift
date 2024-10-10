//
//  ExpenseLineChartView.swift
//  ChartsApp
//
//  Created by Saud Syed on 10/10/2024.
//

import SwiftUI
import Charts

struct ExpenseLineChartView: View {
    
    @ObservedObject var viewModel: ExpenseViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your total expenses for the last year are ") +
            Text("$\(String(format: "%.2f", viewModel.totalExpenses)).")
                .bold()
                .foregroundColor(.pink)
            
            Chart {
                Plot {
                    ForEach(viewModel.monthlyFixedExpensesData, id: \.month) { expenseData in
                        LineMark(x: .value("Month", expenseData.month),
                                 y: .value("Expense", expenseData.amount))
                    }
                    .foregroundStyle(by: .value("Expense", "fixed"))
                    .symbol(by: .value("Expense", "fixed"))
                    
                    ForEach(viewModel.monthlyVariableExpensesData, id: \.month) { expenseData in
                        LineMark(x: .value("Date", expenseData.month),
                                 y: .value("Expense", expenseData.amount))
                    }
                    .foregroundStyle(by: .value("Expense", "variable"))
                    .symbol(by: .value("Expense", "variable"))
                }
                .interpolationMethod(.monotone)
                .lineStyle(StrokeStyle(lineWidth: 3))
            }
            .chartForegroundStyleScale([
                "variable": .purple,
                "fixed": .cyan
            ])
            .aspectRatio(1, contentMode: .fit)
            .chartXScale(domain: 0...13)
            .chartXAxis {
                AxisMarks(values: [1, 4, 7, 10]) { value in
                    AxisGridLine()
                    AxisTick()
                    if let monthNumber = value.as(Int.self), monthNumber > 0, monthNumber < 13 {
                        AxisValueLabel(viewModel.month(for: monthNumber), centered: false, anchor: .top)
                    }
                }
            }
        }
    }
}

#Preview {
    ExpenseLineChartView(viewModel: .preview)
        .padding()
}
