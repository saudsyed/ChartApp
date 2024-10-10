//
//  ExpenseDetailView.swift
//  ChartsApp
//
//  Created by Saud Syed on 10/10/2024.
//

import SwiftUI

struct ExpenseDetailView: View {
    
    @ObservedObject var viewModel: ExpenseViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ExpenseLineChartView(viewModel: viewModel)
                
                ExpenseGridTypeView(viewModel: viewModel)
            }
        }
        .padding()
    }
}

#Preview {
    ExpenseDetailView(viewModel: .preview)
}
