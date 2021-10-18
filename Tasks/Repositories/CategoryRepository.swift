//
//  CategoryRepository.swift
//  Tasks
//
//  Created by Rayana Prata Neves on 17/10/21.
//

import Foundation
import UIKit

class CategoryRepository {
    
    static func getCategories() -> [Category] {
        let categories = [
            Category(name: "Work", color: UIColor.green),
            Category(name: "Study", color: UIColor.blue),
            Category(name: "To Dos", color: UIColor.yellow),
            Category(name: "Reminders", color: UIColor.green)
        ]
        
        return categories;
    }
    
}
