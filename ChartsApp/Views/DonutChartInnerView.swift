//
//  DonutChartInnerView.swift
//  ChartsApp
//
//  Created by Saud Syed on 09/10/2024.
//

import SwiftUI

struct DonutChartInnerView: View {
    
    let bestSellingCategory: BestSellingCategory?
    let frame: CGRect
    
    var body: some View {
        if let bestSellingCategory = bestSellingCategory {
            VStack {
                Text("Most Sold Category")
                    .font(.callout)
                    .foregroundStyle(.secondary)
                Text(bestSellingCategory.category.displayName)
                
                    .font(.title2.bold())
                    .foregroundColor(.primary)
                Text(bestSellingCategory.sales.formatted() + " sold")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
            .position(x: frame.midX, y: frame.midY)
        }
    }
}
