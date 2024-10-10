//
//  ExpenseGridTypeView.swift
//  ChartsApp
//
//  Created by Saud Syed on 10/10/2024.
//

import SwiftUI

struct ExpenseGridTypeView: View {
    
    @ObservedObject var viewModel: ExpenseViewModel
    
    var body: some View {
        Grid(alignment: .trailing, horizontalSpacing: 15, verticalSpacing: 10) {
            GridRow {
                Color.clear
                    .gridCellUnsizedAxes([.vertical, .horizontal])
                Text("Fixed")
                    .gridCellAnchor(.center)
                Text("Variable")
                Text("All")
                    .bold()
                    .gridCellAnchor(.center)
            }
            
            Divider()
                .gridCellUnsizedAxes([.vertical, .horizontal])
            
            ForEach(viewModel.monthlyExpensesData) { expenseData in
                GridRow {
                    Text(viewModel.month(for: expenseData.month))
                    
                    Text(String(format: "%.2f", expenseData.fixedExpenses))
                    Text(String(format: "%.2f", expenseData.variableExpenses))
                    Text(String(format: "%.2f", expenseData.totalExpenses))
                        .bold()
                }
            }
            
            Divider()
                .gridCellUnsizedAxes([.vertical, .horizontal])
            
            GridRow {
                Text("Total")
                    .bold()
                
                Color.clear
                    .gridCellUnsizedAxes([.vertical, .horizontal])
                
                    .gridCellColumns(2) // Span two columns.
                
                Text("$" + String(format: "%.2f", viewModel.totalExpenses))
                    .bold()
                    .foregroundStyle(.pink)
                    .fixedSize()
                
            }
        }
    }
}

#Preview {
    ExpenseGridTypeView(viewModel: .preview)
//        .padding()
}
