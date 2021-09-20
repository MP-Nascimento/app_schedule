//
//  CategoryRepository.swift
//  schedule
//
//  Created by Miguel Nascimento on 17/09/21.
//

import Foundation
import UIKit

class CategoryRepostory{
    static func getCategories() -> [Category] {
        
        let categorys = [
            Category(name: "Work", color: UIColor.green),
            Category(name: "Study", color: UIColor.blue),
            Category(name: "To Dos", color: UIColor.yellow),
            Category(name: "Reminders", color: UIColor.red)
        ]
        return categorys;
    }
}
