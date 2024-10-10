//
//  DashboardView.swift
//  ChartsApp
//
//  Created by Saud Syed on 08/10/2024.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject var salesViewModel: SalesViewModel
    @StateObject var expenseViewModel: ExpenseViewModel
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        SaleDetailView(viewModel: salesViewModel)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        SaleView(viewModel: salesViewModel)
                    }
                }
                
                Section {
                    NavigationLink {
                        SalesByWeekdayDetailView(viewModel: salesViewModel)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        WeekdayView(viewModel: salesViewModel)
                    }
                }
                
                Section {
                    NavigationLink {
                        SalePerBookCategoryDetailView(viewModel: salesViewModel)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        SalePerBookCategoryView(viewModel: salesViewModel)
                    }
                }
                
                Section {
                    NavigationLink {
                        ExpenseDetailView(viewModel: expenseViewModel)
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        ExpenseView(viewModel: expenseViewModel)
                    }
                }
                .navigationTitle("Book Store Stats")
            }
        }
    }
}

#Preview {
    DashboardView(salesViewModel: .preview, expenseViewModel: .preview)
}

