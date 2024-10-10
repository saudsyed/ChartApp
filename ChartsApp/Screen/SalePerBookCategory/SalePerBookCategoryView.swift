//
//  SalePerBookCategoryView.swift
//  ChartsApp
//
//  Created by Saud Syed on 09/10/2024.
//

import SwiftUI
import Charts

struct SalePerBookCategoryView: View {
    
    @ObservedObject var viewModel: SalesViewModel
    
    var body: some View {
        HStack(spacing: 30) {
            SalePerBookCategoryHeaderItemView(viewModel: viewModel, selectedChartStyle: .pie)
            
            Chart(viewModel.totalSalesPerCategory, id: \.category) { categoryData in
                SectorMark(angle: .value("Sales", categoryData.sales),
                           innerRadius: .ratio(0.6),
                           angularInset: 1.5)
                .cornerRadius(5)
                .opacity(categoryData.category == viewModel.bestSellingCategory?.category ? 1 : 0.4)
            }
            .aspectRatio(1, contentMode: .fit)
            .frame(height: 75)
        }
    }
}

#Preview {
    SalePerBookCategoryView(viewModel: .preview)
}
