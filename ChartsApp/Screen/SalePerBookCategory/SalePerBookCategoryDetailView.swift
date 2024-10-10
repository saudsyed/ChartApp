//
//  SalePerBookCategoryDetailView.swift
//  ChartsApp
//
//  Created by Saud Syed on 09/10/2024.
//

import SwiftUI

struct SalePerBookCategoryDetailView: View {
    
    @ObservedObject var viewModel: SalesViewModel
    @State private var selectedChartStyle: ChartStyle = .pie
    
    var body: some View {
        VStack {
            Picker("Chart Type", selection: $selectedChartStyle.animation()) {
                ForEach(ChartStyle.allCases) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
            SalePerBookCategoryHeaderItemView(viewModel: viewModel, selectedChartStyle: selectedChartStyle)
            .font(.title3).padding(.vertical)
            
            switch selectedChartStyle {
            case .bar:
                SalePerBookCategoryBarChartView(viewModel: viewModel)
            case .pie:
                SalePerBookCategoryDonutChartView(viewModel: viewModel)
            case .singleBar:
                SalePerBookCategorySingleBarChartView(viewModel: viewModel)
            }
            
            // dynamically changing the chart data with an animation
            Button(action: {
                // fetch from server instead
                withAnimation {
                    viewModel.salesData = Sale.threeMonthsExamples()
                }
            }, label: {
                Label("Refresh", systemImage: "arrow.triangle.2.circlepath")
            })
            .padding(.top, 50)
            Spacer()
        } .padding()
    }
}

#Preview {
    SalePerBookCategoryDetailView(viewModel: .preview)
}
