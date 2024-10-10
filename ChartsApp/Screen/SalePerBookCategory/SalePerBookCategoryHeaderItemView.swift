//
//  SalePerBookCategoryHeaderItemView.swift
//  ChartsApp
//
//  Created by Saud Syed on 09/10/2024.
//

import SwiftUI

struct SalePerBookCategoryHeaderItemView: View {
    
    @ObservedObject var viewModel: SalesViewModel
    let selectedChartStyle: ChartStyle
    
    var bestsellingCategoryPercentage: String? {
        guard let bestSellingCategory = viewModel.bestSellingCategory else { return nil }
        
        let percentage = Double(bestSellingCategory.sales) / Double(viewModel.totalSales)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .percent
        
        guard let formattedPercentage = numberFormatter.string(from: NSNumber(value: percentage)) else {
            return nil
        }
        
        return formattedPercentage
    }
    
    var body: some View {
        switch selectedChartStyle {
        case .pie, .singleBar:
            if let bestSellingCategory = viewModel.bestSellingCategory,
               let bestsellingCategoryPercentage  {
                Text("Your best selling category is ") + Text("\(bestSellingCategory.category.displayName)").bold().foregroundColor(.blue) +
                Text(" with ") +
                Text("\(bestsellingCategoryPercentage)").bold() +
                Text(" of all sales.")
                
            }
            
        case .bar:
            if let bestSellingCategory = viewModel.bestSellingCategory {
                Text("Your best selling category is ") + Text("\(bestSellingCategory.category.displayName)").bold().foregroundColor(.blue) +
                Text(" with ") +
                Text("\(bestSellingCategory.sales) sales ").bold() +
                Text("in the last 90 days.")
            }
        }
    }
}

#Preview {
    SalePerBookCategoryHeaderItemView(viewModel: .preview, selectedChartStyle: .pie)
}
