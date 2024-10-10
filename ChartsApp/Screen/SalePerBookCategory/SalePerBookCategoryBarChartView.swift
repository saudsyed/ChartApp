//
//  SalePerBookCategoryBarChartView.swift
//  ChartsApp
//
//  Created by Saud Syed on 09/10/2024.
//

import SwiftUI
import Charts

struct SalePerBookCategoryBarChartView: View {
    
    @ObservedObject var viewModel: SalesViewModel
    
    var body: some View {
        Chart(viewModel.totalSalesPerCategory, id: \.category) { data in
            BarMark(x: .value("sales", data.sales),
                    y: .value("Category", data.category.displayName))
            
            .annotation(position: .trailing, alignment: .leading, content: {
                Text(String(data.sales))
                    .opacity(data.category == viewModel.bestSellingCategory?.category ? 1 : 0.4)
            })
            
            .foregroundStyle(by: .value("Name", data.category.displayName))
            .opacity(data.category == viewModel.bestSellingCategory?.category ? 1 : 0.4)
        }
        .chartLegend(.hidden)
        .frame(maxHeight: 400)
    }
}

#Preview {
    SalePerBookCategoryBarChartView(viewModel: .preview)
        .padding()
}
