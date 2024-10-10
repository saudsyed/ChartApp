//
//  SalePerBookCategoryDonutChartView.swift
//  ChartsApp
//
//  Created by Saud Syed on 09/10/2024.
//

import SwiftUI
import Charts

struct SalePerBookCategoryDonutChartView: View {
    
    @ObservedObject var viewModel: SalesViewModel
    
    var body: some View {
        Chart(viewModel.totalSalesPerCategory, id: \.category) { categoryData in
            SectorMark(angle: .value("Sales", categoryData.sales),
                       innerRadius: .ratio(0.6),
                       angularInset: 1.5)
            .cornerRadius(8)
            .foregroundStyle(by: .value("Name", categoryData.category.displayName))
            .opacity(categoryData.category == viewModel.bestSellingCategory?.category ? 1 : 0.4)
        }
        .chartLegend(alignment: .center, spacing: 18)
        .aspectRatio(1, contentMode: .fit)
        .chartBackground { chartProxy in
            GeometryReader(content: { geometry in
                let frame = geometry[chartProxy.plotFrame!]
                DonutChartInnerView(bestSellingCategory: viewModel.bestSellingCategory, frame: frame)
            })
        }
    }
}

#Preview {
    SalePerBookCategoryDonutChartView(viewModel: .preview)
        .padding()
}
