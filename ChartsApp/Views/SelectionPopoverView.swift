//
//  SelectionPopoverView.swift
//  ChartsApp
//
//  Created by Saud Syed on 08/10/2024.
//

import SwiftUI

struct SelectionPopoverView: View {
    
    let selectedDateValue: SelectedDateValue?

    var body: some View {
        if let selectedDateValue {
            VStack {
                Text(selectedDateValue.day.formatted(.dateTime.month().day()))
                Text("\(selectedDateValue.sales) sales")
                    .bold()
                    .foregroundStyle(.blue)
            }
            .padding(6)
            .background {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.white)
                    .shadow(color: .blue, radius: 2)
            }
        }
    }
}
