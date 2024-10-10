//
//  ChartsAppApp.swift
//  ChartsApp
//
//  Created by Saud Syed on 08/10/2024.
//

import SwiftUI

@main
struct ChartsAppApp: App {
    var body: some Scene {
        WindowGroup {
            DashboardView(salesViewModel: .preview, expenseViewModel: .preview)
        }
    }
}
