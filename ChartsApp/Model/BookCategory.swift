//
//  BookCategory.swift
//  ChartsApp
//
//  Created by Saud Syed on 08/10/2024.
//

import Foundation

enum BookCategory: String, Identifiable, CaseIterable {
    case fiction
    case biography
    case children
    case computerScience
    case fantasy
    case business
  
    
    var id: Self { return self }
    
    var displayName: String {
        switch self {
            case .fiction:
                "Fiction"
            case .biography:
                "Biography"
            case .children:
                "Children Books"
            case .computerScience:
                "Computer Science"
            case .fantasy:
                "Fantasy"
            case .business:
                "Business"
        }
    }
}

struct CategorySalesData: Identifiable {
    let category: BookCategory
    let sales: Int
    let startSales: Int
    let endSales: Int
    
    let id = UUID()
}
