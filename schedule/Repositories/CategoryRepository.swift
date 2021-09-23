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
            Category(name: "Trabalho", color: UIColor.green),
            Category(name: "Estudo", color: UIColor.blue),
            Category(name: "Para Fazer", color: UIColor.yellow),
            Category(name: "Lembrete", color: UIColor.red)
        ]
        return categorys;
    }
}
