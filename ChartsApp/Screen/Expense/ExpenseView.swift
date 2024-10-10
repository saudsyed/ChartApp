//
//  ExpenseView.swift
//  ChartsApp
//
//  Created by Saud Syed on 09/10/2024.
//

import SwiftUI
import Charts

struct ExpenseView: View {
    
    @ObservedObject var viewModel: ExpenseViewModel
    let linearGradient = LinearGradient(colors: [Color.pink.opacity(0.7), Color.pink.opacity(0.4)],
                                        startPoint: .top,
                                        endPoint: .bottom)
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Your total expenses for the last year are ") +
            Text("$\(String(format: "%.2f", viewModel.totalExpenses)).")
                .bold()
                .foregroundColor(Color.pink)
            
            Chart {
                Plot {
                    ForEach(viewModel.monthlyExpensesData) { expenseData in
                        AreaMark(x: .value("Date", expenseData.month),
                                 y: .value("Expense", expenseData.totalExpenses))
                    }
                }
                .interpolationMethod(.linear)
                .foregroundStyle(linearGradient)
            }
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .chartLegend(.hidden)
            .chartXScale(domain: 1...12)
            
            .frame(height: 70)
        }
    }
}

#Preview {
    ExpenseView(viewModel: .preview)
        .padding(.horizontal)
}
