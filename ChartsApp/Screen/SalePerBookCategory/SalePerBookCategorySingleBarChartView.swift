//
//  SalePerBookCategorySingleBarChartView.swift
//  ChartsApp
//
//  Created by Saud Syed on 09/10/2024.
//

import SwiftUI
import Charts

struct SalePerBookCategorySingleBarChartView: View {
    
    @ObservedObject var viewModel: SalesViewModel
    
    var salesData: [CategorySalesData] {
        var result = [CategorySalesData]()
        var initialSales = 0
        
        for salesData in viewModel.totalSalesPerCategory {
            result.append(CategorySalesData(category: salesData.category,
                                            sales: salesData.sales,
                                            startSales: initialSales,
                                            endSales: salesData.sales + initialSales))
            initialSales += salesData.sales
        }
        
        return result
    }
    
    var body: some View {
        Chart(salesData) { saleData in
            BarMark(xStart: .value("begin", saleData.startSales),
                    xEnd: .value("End", saleData.endSales),
                    y: .value("Category", 0),
                    height: 70)
            .foregroundStyle(by: .value("Category", saleData.category.displayName))
            .opacity(saleData.category == viewModel.bestSellingCategory?.category ? 1 : 0.4)
            .annotation(position: .overlay) {
                if saleData.category == viewModel.bestSellingCategory?.category {
                    Text(saleData.category.displayName)
                        .foregroundStyle(Color.white)
                        .bold()
                }
            }
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartLegend(alignment: .center, spacing: 18)
        .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    SalePerBookCategorySingleBarChartView(viewModel: .preview)
        .padding()
}
